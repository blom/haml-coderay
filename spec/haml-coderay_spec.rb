require "rubygems"
require File.expand_path("../../lib/haml-coderay", __FILE__)

Haml::Filters::CodeRay.send(:resolve_lazy_requires)

describe Haml::Filters::CodeRay do
  describe :encoder do
    subject { Haml::Filters::CodeRay.encoder }
    specify { should == :div }
  end

  describe :encoder_options do
    subject { Haml::Filters::CodeRay.encoder_options }
    specify { should == {} }
  end

  describe :render do
    context 'given "#!xyz\nfoobar\n"' do
      subject { Haml::Filters::CodeRay.render("#!xyz\nfoobar\n") }
      specify { should include "foobar\n" }
    end
  end

  describe :prepare do
    context 'given "#!x\ny\n"' do
      subject { Haml::Filters::CodeRay.prepare("#!x\ny\n") }
      specify { should == ["y\n", :x] }
    end
  end
end

describe Haml::Filters do
  describe "defined" do
    subject { Haml::Filters.defined }
    specify { should include "coderay" }
  end
  describe 'defined["coderay"]' do
    subject { Haml::Filters.defined["coderay"] }
    specify { should == Haml::Filters::CodeRay }
  end
end

describe Haml::Engine do
  context "valid language specifier" do
    subject { Haml::Engine.new(":coderay\n #!xml\n .").render }
    specify { should be_a String }
  end

  context "valid language specifier with nonexistent language" do
    subject { Haml::Engine.new(":coderay\n #!nonexistent\n .").render }
    specify { should be_a String }
  end

  context "invalid language specifier" do
    subject { lambda { Haml::Engine.new(":coderay\n xml\n .").render } }
    specify { should raise_exception(NoMethodError, /downcase.*nil/) }
  end
end
