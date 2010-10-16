require "rubygems"
require "bundler/setup"
require "mg"
require "rake/clean"
require "rspec/core/rake_task"
require "yard"

CLOBBER.include(".yardoc", "coverage", "doc")
MG.new("haml-coderay.gemspec")

task :default => :spec

RSpec::Core::RakeTask.new :spec do |t|
  t.pattern = "spec/**/*_spec.rb"
  if RUBY_VERSION.to_f == 1.8
    t.rcov      = true
    t.rcov_opts = %w(-x ^/,spec -t --sort coverage)
  end
end

YARD::Rake::YardocTask.new :yard do |t|
  t.files   = %w(lib/**/*.rb - LICENSE)
  t.options = %w(-mmarkdown -rREADME.md -odoc)
end
