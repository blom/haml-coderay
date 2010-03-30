require "rubygems"
require "rake"
require "yard"
require "spec/rake/spectask"
require "lib/haml-coderay"

task :default => :spec

Spec::Rake::SpecTask.new "spec" do |t|
  t.spec_opts << "--color --format nested"
  t.spec_files = FileList["spec/*_spec.rb"]
end

YARD::Rake::YardocTask.new do |t|
  t.files   = %w(lib/**/*.rb)
  t.options = %w(-mmarkdown -rREADME.md -odoc)
end
