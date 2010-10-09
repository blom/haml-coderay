require "haml-coderay"

$HC_ENCODER         ||= Haml::Filters::CodeRay.encoder
$HC_ENCODER_OPTIONS ||= Haml::Filters::CodeRay.encoder_options

Spec::Runner.configure do |config|
  config.before :each do
    Haml::Filters::CodeRay.encoder         = $HC_ENCODER
    Haml::Filters::CodeRay.encoder_options = $HC_ENCODER_OPTIONS
  end
end

Spec::Matchers.define :include_module do |expected|
  match do |filter|
    filter.included_modules.include?(expected)
  end
end

Spec::Matchers.define :lazy_require do |expected|
  match do |filter|
    filter.instance_variable_get(:@lazy_requires).include?(expected.to_s)
  end
end
