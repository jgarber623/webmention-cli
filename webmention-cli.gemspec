# frozen_string_literal: true

require_relative "lib/webmention/cli/version"

Gem::Specification.new do |spec|
  spec.required_ruby_version = ">= 2.7"

  spec.name          = "webmention-cli"
  spec.version       = Webmention::CLI::VERSION
  spec.authors       = ["Jason Garber"]
  spec.email         = ["jason@sixtwothree.org"]

  spec.summary       = "A command-line interface for Webmention."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/jgarber623/webmention-cli"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"].reject { |f| File.directory?(f) }
  spec.files        += ["LICENSE", "CHANGELOG.md", "README.md"]
  spec.files        += ["webmention-cli.gemspec"]

  spec.bindir        = "exe"
  spec.executables   = ["webmention"]
  spec.require_paths = ["lib"]

  spec.metadata = {
    "bug_tracker_uri" => "#{spec.homepage}/issues",
    "changelog_uri" => "#{spec.homepage}/blob/v#{spec.version}/CHANGELOG.md",
    "rubygems_mfa_required" => "true",
    "source_code_uri" => "#{spec.homepage}/tree/v#{spec.version}"
  }

  spec.add_dependency "thor", "~> 1.3"
  spec.add_dependency "webmention", "~> 7.0"
end
