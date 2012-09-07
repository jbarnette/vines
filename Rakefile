# encoding: UTF-8

require 'bundler/gem_tasks'
require 'bundler/setup'
require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.libs << 'test/storage'
  test.pattern = 'test/**/*_test.rb'
  test.warning = false
end

task :default => :test
