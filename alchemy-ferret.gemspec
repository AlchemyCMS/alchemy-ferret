# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alchemy/ferret/version'

Gem::Specification.new do |spec|
  spec.name          = "alchemy-ferret"
  spec.version       = Alchemy::Ferret::VERSION
  spec.authors       = ["Thomas von Deyen"]
  spec.email         = ["alchemy@magiclabs.de"]
  spec.description   = %q{Ferret search for Alchemy CMS}
  spec.summary       = %q{Adds Ferret full text search to Alchemy CMS}
  spec.homepage      = "http://alchemy-cms.com"
  spec.license       = "BSD"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "alchemy_cms"
  spec.add_runtime_dependency "acts_as_ferret", ["~> 0.5"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-rails"
end
