require "mg"
require "rake/clean"
require "spec/rake/spectask"
require "yard"
require File.expand_path("../lib/haml-coderay", __FILE__)

MG.new("haml-coderay.gemspec")
CLOBBER.include(".yardoc", "doc")

task :default => :spec

Spec::Rake::SpecTask.new "spec" do |t|
  t.spec_opts << "--color --format nested"
  t.spec_files = FileList["spec/*_spec.rb"]
end

YARD::Rake::YardocTask.new do |t|
  t.files   = %w(lib/**/*.rb)
  t.options = %w(-mmarkdown -rREADME.md -odoc)
end
