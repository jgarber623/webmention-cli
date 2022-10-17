# frozen_string_literal: true

require 'debug'
require 'simplecov'
require 'webmock/rspec'

require 'webmention/cli'

RSpec.configure(&:disable_monkey_patching!)
