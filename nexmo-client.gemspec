# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nexmo-client/version', __FILE__)

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'nexmo-saddle-client'
  s.version       = ::NEXMO::VERSION
  s.authors       = ['Henry Cai']
  s.email         = ['minghangcai@gmail.com']
  s.description   = %q{Nexmo api ruby client}
  s.summary       = %q{
    This is a NEXMO api client implemented on Saddle
  }
  s.homepage      = 'https://github.com/hcai/nexmo-client.git'
  s.license       = 'MIT'

  s.require_path  = 'lib'
  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})

  s.add_dependency 'saddle', '~> 0.0.49'
  s.add_dependency 'simple_oauth', '~> 0.2.0'
end
