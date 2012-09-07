# encoding: UTF-8

require 'rake'
require 'rake/clean'
require 'rake/testtask'
require 'rubygems/package_task'
require_relative 'lib/vines/version'

CLOBBER.include('pkg')

spec = Gem::Specification.new do |s|
  s.name    = "vines-core"
  s.version = Vines::VERSION

  s.summary     = "Vines is an XMPP chat server that's easy to install and run."
  s.description = "Vines is an XMPP chat server that supports thousands of
simultaneous connections by using EventMachine for asynchronous IO. User data
is stored in a SQL database, CouchDB, MongoDB, Redis, the file system, or a
custom storage implementation that you provide. LDAP authentication can be used
so user names and passwords aren't stored in the chat database. SSL encryption
is mandatory on all client and server connections."

  s.authors      = ["David Graham"]
  s.email        = %w[david@negativecode.com]
  s.homepage     = "http://www.getvines.org"

  s.test_files   = FileList["test/**/*"].to_a
  s.executables  = %w[vines]
  s.require_path = "lib"

  s.add_dependency "activerecord", "~> 3.2.3"
  s.add_dependency "bcrypt-ruby", "~> 3.0.1"
  s.add_dependency "em-http-request", "~> 1.0.2"
  s.add_dependency "em-hiredis", "~> 0.1.1"
  s.add_dependency "eventmachine", ">= 0.12.10"
  s.add_dependency "http_parser.rb", "~> 0.5.3"
  s.add_dependency "mongo", "~> 1.5.2"
  s.add_dependency "bson_ext", "~> 1.5.2"
  s.add_dependency "net-ldap", "~> 0.3.1"
  s.add_dependency "nokogiri", "~> 1.4.7"

  s.add_development_dependency "minitest", "~> 2.12.1"
  s.add_development_dependency "rake"
  s.add_development_dependency "sqlite3"

  s.required_ruby_version = '>= 1.9.2'
end

desc 'Build distributable packages'
task :build do
  spec.files = FileList['[A-Z]*', '{bin,lib,conf}/**/*'].to_a
  Gem::PackageTask.new(spec).define
  Rake::Task['gem'].invoke
end

module Rake
  class TestTask
    # use our custom test loader
    def rake_loader
      'test/rake_test_loader.rb'
    end
  end
end

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.libs << 'test/storage'
  test.pattern = 'test/**/*_test.rb'
  test.warning = false
end

task :default => [:clobber, :test, :build]
