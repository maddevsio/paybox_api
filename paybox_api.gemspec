# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paybox_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'paybox_api'
  spec.version       = PayboxApi::VERSION
  spec.authors       = ['Mad Devs', 'Pavel Kalashnikov']
  spec.email         = ['rock@maddevs.io', 'kalashnikovisme@gmail.com']

  spec.summary       = 'Paybox API wrapper for version 4+'
  spec.description   = 'Paybox API wrapper for version 4+'
  spec.homepage      = 'https://github.com/maddevsio/paybox_api'
  spec.license       = 'MIT'
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'webmock'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
