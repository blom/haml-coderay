require File.expand_path("../../lib/haml-coderay", __FILE__)
require "rspec"

RSpec.configure do |config|
  config.before :each do
    Haml::Filters::CodeRay.encoder = Haml::Filters::CodeRay::ENCODER
    Haml::Filters::CodeRay.encoder_options =
      Haml::Filters::CodeRay::ENCODER_OPTIONS
  end
end

RSpec::Matchers.define :include_module do |_module|
  match do |filter|
    filter.included_modules.include?(_module)
  end
end

RSpec::Matchers.define :lazy_require do |library|
  match do |filter|
    filter.instance_variable_get(:@lazy_requires).include?(library.to_s)
  end
end

shared_examples_for "haml-coderay filters" do
  it { should include_module Haml::Filters::Base }
  it { should lazy_require :coderay }
end
