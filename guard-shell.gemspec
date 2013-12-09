# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'guard/shell/version'

Gem::Specification.new do |s|
  s.name         = "guard-shell"
  s.author       = "Joshua Hawxwell"
  s.email        = "m@hawx.me"
  s.summary      = "Guard gem for running shell commands"
  s.homepage     = "http://github.com/hawx/guard-shell"
  s.version      = Guard::ShellVersion::VERSION

  s.description  = <<-DESC
    Guard::Shell automatically runs shell commands when watched files are
    modified.
  DESC

  s.add_dependency 'guard', '>= 1.1.0'

  s.files        = %w(Readme.md LICENSE)
  s.files       += Dir["{lib}/**/*"]
end
