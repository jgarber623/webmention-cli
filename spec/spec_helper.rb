require 'bundler/setup'
require 'simplecov'
require 'webmock/rspec'

require 'webmention/cli'

RSpec.configure(&:disable_monkey_patching!)
