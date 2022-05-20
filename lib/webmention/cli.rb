# frozen_string_literal: true

require 'thor'
require 'webmention'

require_relative 'cli/version'

require_relative 'cli/runner'

module Webmention
  module CLI
    def self.start
      Runner.start
    end
  end
end
