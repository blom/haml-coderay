# coding: utf-8

Gem::Specification.new do |spec|
  spec.name        = "haml-coderay"
  spec.version     = File.read(File.expand_path("../VERSION", __FILE__)).chomp
  spec.summary     = "CodeRay filter for Haml"
  spec.description = "Adds a CodeRay syntax highlighting filter to Haml"
  spec.license     = "ISC"
  spec.files       = Dir["lib/*.rb", "[A-Z][A-Z]*"]
  spec.author      = "Ørjan Blom"
  spec.email       = "blom@blom.tv"
  spec.homepage    = "https://github.com/blom/haml-coderay"

  spec.add_dependency "coderay"
  spec.add_dependency "haml"

  spec.add_development_dependency "kramdown"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "yard"
end
