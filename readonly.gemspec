# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'readonly/version'

Gem::Specification.new do |spec|
  spec.name          = 'readonly'
  spec.version       = ReadOnly::VERSION
  spec.authors       = ['Konstantin Gredeskoul']
  spec.email         = ['kig@reinvent.one']

  spec.summary       = %q{This gem offers a proxy class that can be used to create a read-only wrappers around any other class, by declaring which methods can be delegated to the wrapped class.}
  spec.description   = %q{This gem offers a proxy class that can be used to create a read-only wrappers around any other class, by declaring which methods can be delegated to the wrapped class.}
  spec.homepage      = 'https://github.com/kigster/readonly'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'simplecov', '~> 0.12'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0'
  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
