require "coderay"
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
# @see Haml::Filters::CodeRay_raw
# @see http://rubydoc.info/gems/haml/Haml/Filters
# @see http://rubydoc.info/gems/coderay/CodeRay/Scanners
module Haml::Filters::CodeRay
  include Haml::Filters::Base

  ENCODER = :div
  ENCODER_OPTIONS = {}
  VERSION = File.read(File.expand_path("../../VERSION", __FILE__)).chomp

  # Encoder (_default_: {ENCODER}).
  #
  # @see http://rubydoc.info/gems/coderay/CodeRay/Encoders
  attr_accessor :encoder
  self.encoder ||= ENCODER

  # Encoder options (_default_: {ENCODER_OPTIONS}).
  #
  # @see http://rubydoc.info/gems/coderay/CodeRay/Encoders
  attr_accessor :encoder_options
  self.encoder_options ||= ENCODER_OPTIONS

  # Prepares the text for passing to `::CodeRay.scan`.
  #
  # @param [String] text
  # @return [Array<String, Symbol>] code and language
  def prepare(text)
    [text.sub(/\A\s*#!(\S+)\s*\n+/, ""), $1.downcase.to_sym]
  end

  # @param [String] text text to render
  # @return [String] rendered text
  #
  # @see http://rubydoc.info/gems/coderay/CodeRay.scan
  def render(text)
    ::CodeRay.scan(*prepare(text)).send(encoder, encoder_options)
  end
end

# {Haml::Filters::CodeRay} without `#{}` interpolation.
#
# @example Ruby
#
#   :coderay_raw
#     #!ruby
#
#     if true
#       puts "#{hello}"
#     end
#
# @see Haml::Filters::CodeRay
module Haml::Filters::CodeRay_raw
  include Haml::Filters::Base

  def compile(precompiler, text)
    text = Haml::Helpers.find_and_preserve(
      Haml::Filters::CodeRay.render(text).rstrip,
      precompiler.options[:preserve])
    precompiler.send(:push_text, text)
  end
end
