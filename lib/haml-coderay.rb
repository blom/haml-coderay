require "haml"

# CodeRay filter for Haml. Specify which language to highlight with a shebang
# followed by the language name.
#
# @example Ruby
#
#   :coderay
#     #!ruby
#
#     if true
#       puts "hello"
#     end
#
# @see http://haml-lang.com/docs/yardoc/Haml/Filters.html
# @see http://coderay.rubychan.de/doc/classes/CodeRay/Scanners.html
module Haml::Filters::CodeRay
  include Haml::Filters::Base
  lazy_require "coderay"

  defined?(self::VERSION) ||
    VERSION = "0.0.2".freeze

  # Encoder (_default_: `:div`).
  #
  # @see http://coderay.rubychan.de/doc/classes/CodeRay/Encoders.html
  attr_accessor :encoder
  self.encoder ||= :div

  # Encoder options (_default_: `{}`).
  #
  # @see http://coderay.rubychan.de/doc/classes/CodeRay/Encoders.html
  attr_accessor :encoder_options
  self.encoder_options ||= {}

  # Prepares the text for passing to `::CodeRay.scan`.
  #
  # @param [String] text
  # @return [Array<String, Symbol>] code and language
  def prepare(text)
    [ text.sub(/\A\s*#!(\S+)\s*\n+/, ""), $1.downcase.to_sym ]
  end

  # @param [String] text text to render
  # @return [String] rendered text
  #
  # @see http://coderay.rubychan.de/doc/classes/CodeRay.html#M000008
  def render(text)
    ::CodeRay.scan(*prepare(text)).send(encoder, encoder_options)
  end
end
