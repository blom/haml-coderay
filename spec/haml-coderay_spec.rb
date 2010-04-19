require "rubygems"
require "haml-coderay"

Haml::Filters::CodeRay.send(:resolve_lazy_requires)

describe Haml::Filters::CodeRay do
  subject { Haml::Filters::CodeRay }
  its(:encoder) { should == :div }
  its(:encoder_options) { should == {} }

  describe :encoder= do
    before do
      @old = Haml::Filters::CodeRay.encoder
      @new = rand
    end
    after { Haml::Filters::CodeRay.encoder = @old }

    it "should assign" do
      Haml::Filters::CodeRay.encoder = @new
      Haml::Filters::CodeRay.encoder.should == @new
    end
  end

  describe :encoder_options= do
    before do
      @old = Haml::Filters::CodeRay.encoder_options
      @new = rand
    end
    after { Haml::Filters::CodeRay.encoder_options = @old }

    it "should assign" do
      Haml::Filters::CodeRay.encoder_options = @new
      Haml::Filters::CodeRay.encoder_options.should == @new
    end
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
  subject { Haml::Filters }
  its(:defined) { should include "coderay" }

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
