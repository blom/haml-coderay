Gem::Specification.new do |spec|
  spec.name        = "haml-coderay"
  spec.version     = "0.0.0"
  spec.summary     = "CodeRay filter for Haml"
  spec.description = "Adds a CodeRay syntax highlighting filter to Haml"
  spec.author      = "Ørjan Blom"
  spec.email       = "blom@blom.tv"
  spec.homepage    = "http://github.com/blom/haml-coderay"
  spec.files       = %w(LICENSE README.md lib/haml-coderay.rb)

  spec.add_dependency "haml"
  spec.add_dependency "coderay"
end
