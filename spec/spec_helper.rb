# frozen_string_literal: true

require 'pry-byebug'

require 'simplecov'
require 'webmock/rspec'

require 'webmention/cli'

RSpec.configure(&:disable_monkey_patching!)
