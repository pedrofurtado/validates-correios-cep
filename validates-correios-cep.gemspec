# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'validates-correios-cep/version'

Gem::Specification.new do |spec|
  spec.name          = 'validates-correios-cep'
  spec.version       = ValidatesCorreiosCep::VERSION
  spec.authors       = ['Pedro Furtado']
  spec.email         = ['pedro.felipe.azvedo.furtado@gmail.com']

  spec.summary       = %q{Brazilian zipcode validations for ActiveRecord, integrated with correios-cep gem.}
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/pedrofurtado/validates-correios-cep'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rails'
  spec.add_dependency 'activemodel'
  spec.add_dependency 'correios-cep'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'sqlite3'
end
