require 'thor'

require 'indieweb/endpoints'
require 'webmention'
require 'webmention/verification'

require 'webmention/cli/version'
require 'webmention/cli/exceptions'

require 'webmention/cli/commands/endpoint'
require 'webmention/cli/commands/send'
require 'webmention/cli/commands/verify'

require 'webmention/cli/runner'

module Webmention
  module CLI
    def self.start(argv)
      Runner.start(argv)
    end
  end
end
