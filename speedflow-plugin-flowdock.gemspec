# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'speedflow/plugin/flowdock/version'

Gem::Specification.new do |spec|
  spec.name          = 'speedflow-plugin-flowdock'
  spec.version       = Speedflow::Plugin::Flowdock::VERSION
  spec.authors       = ['Julien Breux']
  spec.email         = ['julien.breux@gmail.com']

  spec.summary       = 'A Speedflow plugin to work with Flowdock.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/speedflow/speedflow-plugin-flowdock'
  spec.license       = 'MIT'

  spec.files         = Dir[
    'LICENSE', 'README.md', 'lib/**/*', 'bin/**/*', 'spec/**/*'
  ]
  spec.bindir        = 'bin'
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3'

  # Core dependencies
  spec.add_dependency 'speedflow', '~> 0.3'
  spec.add_dependency 'flowdock', '~> 0.7.1'

  # Development dependencies
  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 11.1'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'fuubar', '~> 2.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.6'
  spec.add_development_dependency 'guard-rubocop', '~> 1.2'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.5'
  spec.add_development_dependency 'simplecov', '~> 0.11'
end
