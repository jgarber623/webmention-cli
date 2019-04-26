require 'bundler/gem_tasks'

require 'reek/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

Reek::Rake::Task.new
RSpec::Core::RakeTask.new
RuboCop::RakeTask.new

task default: [:rubocop, :reek, :spec]
