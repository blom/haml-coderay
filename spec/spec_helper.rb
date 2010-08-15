require "rubygems"
require "haml-coderay"

Spec::Runner.configure do |config|
  config.before :each do
    @@encoder         ||= Haml::Filters::CodeRay.encoder
    @@encoder_options ||= Haml::Filters::CodeRay.encoder_options

    Haml::Filters::CodeRay.encoder         = @@encoder
    Haml::Filters::CodeRay.encoder_options = @@encoder_options
  end
end
