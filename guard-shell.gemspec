# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'guard/shell'

Gem::Specification.new do |s|
  s.name        = 'guard-shell'
  s.version     = Guard::Shell::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Joshua Hawxwell']
  s.email       = ['m@hawx.me']
  s.homepage    = 'http://rubygems.org/gems/guard-shell'
  s.summary     = 'Guard gem for running shell commands'
  s.description = 'Guard::Shell automatically runs shell commands when watched files are modified.'
  
  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'guard-shell'
  
  s.add_dependency 'guard',   '>= 0.2.0'
  
  s.add_development_dependency 'bundler', '~> 1.0.2'
  s.add_development_dependency 'rspec',   '~> 2.0.0.rc'
  
  s.files        = Dir.glob('{lib}/**/*') + %w[LICENSE README.md]
  s.require_path = 'lib'
end