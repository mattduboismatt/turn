# frozen_string_literal: true
require "rake"
require "hanami/rake_tasks"
require "rubocop/rake_task"

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
  RuboCop::RakeTask.new
  task(:default).clear.enhance(%w[rubocop spec])
rescue LoadError
  nil
end
