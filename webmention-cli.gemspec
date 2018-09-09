lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'webmention_cli/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = ['>= 2.4', '< 2.6']

  spec.name          = 'webmention-cli'
  spec.version       = WebmentionCLI::VERSION
  spec.authors       = ['Jason Garber']
  spec.email         = ['jason@sixtwothree.org']

  spec.summary       = 'A command-line interface for Webmention.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/jgarber623/webmention-cli'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(bin|spec)/}) }

  spec.bindir        = 'exe'
  spec.executables   = ['webmention']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16', '>= 1.16.3'
  spec.add_development_dependency 'rake', '~> 12.3', '>= 12.3.1'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rubocop', '~> 0.59.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.28'
  spec.add_development_dependency 'simplecov', '~> 0.16.1'
  spec.add_development_dependency 'simplecov-console', '~> 0.4.2'

  spec.add_runtime_dependency 'thor', '~> 0.20.0'
  spec.add_runtime_dependency 'webmention-endpoint', '~> 2.0'
  spec.add_runtime_dependency 'webmention-verification', '~> 0.1.0'
end
