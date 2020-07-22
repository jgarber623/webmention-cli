require_relative 'lib/webmention/cli/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5', '< 2.8')

  spec.name          = 'webmention-cli'
  spec.version       = Webmention::CLI::VERSION
  spec.authors       = ['Jason Garber']
  spec.email         = ['jason@sixtwothree.org']

  spec.summary       = 'A command-line interface for Webmention.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/jgarber623/webmention-cli'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(bin|spec)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = ['webmention']
  spec.require_paths = ['lib']

  spec.metadata['bug_tracker_uri'] = "#{spec.homepage}/issues"
  spec.metadata['changelog_uri']   = "#{spec.homepage}/blob/v#{spec.version}/CHANGELOG.md"

  spec.add_runtime_dependency 'indieweb-endpoints', '~> 4.0'
  spec.add_runtime_dependency 'thor', '~> 1.0'
  spec.add_runtime_dependency 'webmention', '~> 3.0'
  spec.add_runtime_dependency 'webmention-verification', '~> 3.0'
end
