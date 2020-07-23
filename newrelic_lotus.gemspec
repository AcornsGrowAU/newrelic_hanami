# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'newrelic_hanami/version'

Gem::Specification.new do |spec|
  spec.name          = "newrelic_hanami"
  spec.version       = NewRelic::Hanami::VERSION
  spec.authors       = ["Kyle Chong"]
  spec.email         = ["kyle.chong@acorns.com"]

  spec.summary       = "NewRelic instrumentation for Hanami."
  spec.description   = "Reports Hanami controller actions to NewRelic."
  spec.homepage      = "https://github.com/Acornsgrow/newrelic_hanami"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "rack-test"

  spec.add_runtime_dependency 'newrelic_rpm'
  spec.add_runtime_dependency 'hanami-controller', '>= 0.6', '< 2.0'
end
