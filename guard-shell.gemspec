# -*- encoding: utf-8 -*-
require File.expand_path("../lib/guard/shell", __FILE__)

Gem::Specification.new do |s|
  s.name         = "guard-shell"
  s.author       = "Joshua Hawxwell"
  s.email        = "m@hawx.me"
  s.summary      = "Guard gem for running shell commands"
  s.homepage     = "http://github.com/hawx/guard-shell"
  s.version      = Guard::Shell::VERSION
  
  s.description  = <<-DESC
    Guard::Shell automatically runs shell commands when watched files are 
    modified.
  DESC
  
  s.add_dependency 'guard', '>= 0.2.0'
  s.add_development_dependency 'bundler', '~> 1.0.2'
  
  s.files        = %w(README.md LICENSE)
  s.files       += Dir["{lib}/**/*"]
end