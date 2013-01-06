require "rubygems"
require "bundler/setup"
require "rake/clean"
require "rspec/core/rake_task"
require "yard"

CLOBBER.include(".yardoc", "coverage", "doc")

task :default => :spec

desc "Generate coverage data"
task :coverage do
  ENV["SIMPLECOV"] = ""
  Rake::Task["spec"].invoke
end

RSpec::Core::RakeTask.new :spec do |t|
  t.pattern = "spec/**/*_spec.rb"
end

YARD::Rake::YardocTask.new :yard do |t|
  t.files   = %w(lib/**/*.rb - LICENSE)
  t.options = %w(-mmarkdown -rREADME.md -odoc)
end
