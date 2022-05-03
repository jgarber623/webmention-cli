# frozen_string_literal: true

require 'thor'

require 'indieweb/endpoints'
require 'webmention'
require 'webmention/verification'

require_relative 'cli/version'
require_relative 'cli/exceptions'

require_relative 'cli/commands/endpoint'
require_relative 'cli/commands/send'
require_relative 'cli/commands/verify'

require_relative 'cli/runner'

module Webmention
  module CLI
    def self.start(argv)
      Runner.start(argv)
    end
  end
end
