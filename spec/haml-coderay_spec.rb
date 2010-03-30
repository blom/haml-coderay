require "rubygems"
require "lib/haml-coderay"

describe Haml::Filters::CodeRay do
  describe :encoder do
    subject { Haml::Filters::CodeRay.encoder }
    specify { should == :div }
  end

  describe :encoder_options do
    subject { Haml::Filters::CodeRay.encoder_options }
    specify { should == {} }
  end
end

describe Haml::Filters.defined["coderay"], %<["coderay"]> do
  it { should == Haml::Filters::CodeRay }
end

describe Haml::Engine do
  it "should accept :coderay" do
    Haml::Engine.new(":coderay\n !xml\n .").
    render.should be_a String
  end

  it "should not accept :coderay without language specifier" do
    lambda {
      Haml::Engine.new(":coderay\n xml\n .").render
    }.should raise_exception(NoMethodError, /downcase.*nil/)
  end
end
