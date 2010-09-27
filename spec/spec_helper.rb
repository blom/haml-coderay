require "rubygems"
require "haml-coderay"

$HC_ENCODER         ||= Haml::Filters::CodeRay.encoder
$HC_ENCODER_OPTIONS ||= Haml::Filters::CodeRay.encoder_options

Spec::Runner.configure do |config|
  config.before :each do
    Haml::Filters::CodeRay.encoder         = $HC_ENCODER
    Haml::Filters::CodeRay.encoder_options = $HC_ENCODER_OPTIONS
  end
end
