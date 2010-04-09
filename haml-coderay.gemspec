require File.expand_path("../lib/haml-coderay", __FILE__)

Gem::Specification.new do |spec|
  spec.name        = "haml-coderay"
  spec.version     = Haml::Filters::CodeRay::VERSION.dup
  spec.summary     = "CodeRay filter for Haml"
  spec.description = "Adds a CodeRay syntax highlighting filter to Haml"
  spec.files       = Dir.glob("lib/**/*.rb") + %w(LICENSE README.md)
  spec.author      = "Ørjan Blom"
  spec.email       = "blom@blom.tv"
  spec.homepage    = "http://github.com/blom/haml-coderay"

  spec.add_dependency "coderay"
  spec.add_dependency "haml"

  spec.add_development_dependency "mg"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "yard"
end
