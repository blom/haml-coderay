if ENV["SIMPLECOV"]
  require "simplecov"
  SimpleCov.start { add_filter "spec" }
end

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

shared_examples_for "haml-coderay filters" do
  it { should include_module Haml::Filters::Base }
end
