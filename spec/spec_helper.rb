require "haml-coderay"
require "rspec"

RSpec.configure do |config|
  config.before :each do
    Haml::Filters::CodeRay.encoder = Haml::Filters::CodeRay::ENCODER
    Haml::Filters::CodeRay.encoder_options =
      Haml::Filters::CodeRay::ENCODER_OPTIONS
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
