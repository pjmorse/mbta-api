# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mbta/api/version'

Gem::Specification.new do |spec|
  spec.name          = "mbta-api"
  spec.version       = Mbta::Api::VERSION
  spec.authors       = ["Parker Morse"]
  spec.email         = ["flashesofpanic@gmail.com"]

  spec.summary       = %q{A thin wrapper around the MBTA "realtime" API for Boston-area transit data.}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_dependency "httparty"
end
