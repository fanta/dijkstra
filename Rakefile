require 'rspec/core/rake_task'
require './main'

RSpec::Core::RakeTask.new(:spec)

task :tests => :spec
task :default => :spec

task :run_example do
  exec 'ruby main'
end