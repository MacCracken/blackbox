require "bundler/gem_tasks"
require "rspec/core/rake_task"

FileUtils.mkdir_p "results"

RSpec::Core::RakeTask.new(:spec)
task :default => :spec