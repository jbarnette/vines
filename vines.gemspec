# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vines/version'

Gem::Specification.new do |gem|
  gem.name          = "vines-core"
  gem.version       = Vines::VERSION
  gem.authors       = ["David Graham"]
  gem.email         = ["david@negativecode.com"]
  gem.description   = "The core server for Vines, a friendly XMPP chat server."
  gem.summary       = "A friendly XMPP chat server."
  gem.homepage      = "http://www.getvines.org"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "bcrypt-ruby", "~> 3.0.1"
  gem.add_dependency "em-http-request", "~> 1.0.3"
  gem.add_dependency "eventmachine", "~> 1.0.0"
  gem.add_dependency "http_parser.rb", "~> 0.5.3"
  gem.add_dependency "nokogiri", "~> 1.5.5"

  gem.add_development_dependency "minitest", "~> 3.4.0"
  gem.add_development_dependency "rake"

  gem.required_ruby_version = '>= 1.9.2'
end
