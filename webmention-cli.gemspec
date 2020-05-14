lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'webmention/cli/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = ['>= 2.5', '< 2.8']

  spec.name          = 'webmention-cli'
  spec.version       = Webmention::CLI::VERSION
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

  spec.metadata = {
    'bug_tracker_uri' => "#{spec.homepage}/issues",
    'changelog_uri'   => "#{spec.homepage}/blob/v#{spec.version}/CHANGELOG.md"
  }

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'reek', '~> 6.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 0.83.0'
  spec.add_development_dependency 'rubocop-performance', '~> 1.5'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.39'
  spec.add_development_dependency 'simplecov', '~> 0.18.5'
  spec.add_development_dependency 'simplecov-console', '~> 0.7.2'
  spec.add_development_dependency 'webmock', '~> 3.8'

  spec.add_runtime_dependency 'indieweb-endpoints', '~> 2.0'
  spec.add_runtime_dependency 'thor', '~> 1.0'
  spec.add_runtime_dependency 'webmention', '~> 2.1'
  spec.add_runtime_dependency 'webmention-verification', '~> 2.0'
end
