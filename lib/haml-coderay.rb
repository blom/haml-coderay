require "haml"

# CodeRay filter for Haml. Specify language to highlight with a shebang
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
# @example XML
#
#   :coderay
#     #!xml
#
#     <foo>
#       <bar>...</bar>
#     </foo>
module Haml::Filters::CodeRay
  include Haml::Filters::Base
  lazy_require "coderay"

  class << self
    # CodeRay encoder (_default_: `:div`).
    attr_accessor :encoder

    # CodeRay encoder options (_default_: `{}`).
    attr_accessor :encoder_options
  end
  self.encoder = :div
  self.encoder_options = {}

  # @param [String] text text to render
  def render(text)
    text.sub!(/\A\s*#!(\S+)\s+/, '')
    ::CodeRay.scan(text, $1.downcase.to_sym).
      send(encoder, encoder_options)
  end
end
