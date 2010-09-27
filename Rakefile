require "rubygems"
require "bundler/setup"
require "mg"
require "rake/clean"
require "spec/rake/spectask"
require "yard"

CLOBBER.include(".yardoc", "doc")
MG.new("haml-coderay.gemspec")

task :default => :spec

Spec::Rake::SpecTask.new :spec do |t|
  t.libs       = %w(lib spec)
  t.spec_opts << "--color --format nested"
  t.spec_files = FileList["spec/*_spec.rb"]
end

YARD::Rake::YardocTask.new :yard do |t|
  t.files   = %w(lib/**/*.rb - LICENSE)
  t.options = %w(-mmarkdown -rREADME.md -odoc)
end
