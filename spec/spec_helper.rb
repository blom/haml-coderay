require "haml-coderay"
require "rspec"

$HC_ENCODER         ||= Haml::Filters::CodeRay.encoder
$HC_ENCODER_OPTIONS ||= Haml::Filters::CodeRay.encoder_options

RSpec.configure do |config|
  config.before :each do
    Haml::Filters::CodeRay.encoder         = $HC_ENCODER
    Haml::Filters::CodeRay.encoder_options = $HC_ENCODER_OPTIONS
  end
end

shared_examples_for "haml-coderay filters" do
  it "should include module Haml::Filters::Base" do
    subject.included_modules.include?(Haml::Filters::Base).should be true
  end

  it "should lazy_require coderay" do
    subject.instance_variable_get(:@lazy_requires).include?("coderay").
    should be true
  end
end
