require "spec_helper"

Haml::Filters::CodeRay.send(:resolve_lazy_requires)

describe Haml::Filters::CodeRay do
  it_should_behave_like "haml-coderay filters"

  its(:encoder) { should == Haml::Filters::CodeRay::ENCODER }
  its(:encoder_options) { should == Haml::Filters::CodeRay::ENCODER_OPTIONS }

  describe :ENCODER do
    specify { Haml::Filters::CodeRay::ENCODER.should be :div }
  end

  describe :ENCODER_OPTIONS do
    specify { Haml::Filters::CodeRay::ENCODER_OPTIONS.should == {} }
  end

  describe :VERSION do
    let(:version) { Haml::Filters::CodeRay::VERSION }
    specify { version.should match /\A\d+\.\d+\.\d+\z/ }
  end

  describe :encoder= do
    it "should assign" do
      value = rand
      Haml::Filters::CodeRay.encoder = value
      Haml::Filters::CodeRay.encoder.should == value
    end
  end

  describe :encoder_options= do
    it "should assign" do
      value = rand
      Haml::Filters::CodeRay.encoder_options = value
      Haml::Filters::CodeRay.encoder_options.should == value
    end
  end

  describe :render do
    context 'given "#!text\nfoobar\n"' do
      subject { Haml::Filters::CodeRay.render("#!text\nfoobar\n") }
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

describe Haml::Filters::CodeRay_raw do
  it_should_behave_like "haml-coderay filters"

  it 'should act like CodeRay but without the need to escape #{}' do
    x = Haml::Engine.new(    ":coderay\n #!ruby\n " + 'x \#{ohai2u} y').render
    y = Haml::Engine.new(":coderay_raw\n #!ruby\n " + "x \#{ohai2u} y").render
    x.should == y
  end
end

describe Haml::Filters do
  its(:defined) { should include "coderay" }
  its(:defined) { should include "coderay_raw" }

  describe 'defined["coderay"]' do
    subject { Haml::Filters.defined["coderay"] }
    specify { should == Haml::Filters::CodeRay }
  end

  describe 'defined["coderay_raw"]' do
    subject { Haml::Filters.defined["coderay_raw"] }
    specify { should == Haml::Filters::CodeRay_raw }
  end
end

describe Haml::Engine do
  context "valid language specifier" do
    subject { Haml::Engine.new(":coderay\n #!xml\n .").render }
    specify { should be_a String }
  end

  context "invalid language specifier" do
    subject { lambda { Haml::Engine.new(":coderay\n xml\n .").render } }
    specify { should raise_exception(NoMethodError, /downcase.*nil/) }
  end
end
