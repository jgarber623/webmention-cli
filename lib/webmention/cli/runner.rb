# frozen_string_literal: true

module Webmention
  module CLI
    class Runner < Thor
      include Thor::Actions

      package_name 'Webmention'

      map ['-v', '--version'] => :__version

      desc 'endpoint <target>', 'Discover Webmention endpoint for <target> URL'
      def endpoint(target)
        url = Commands::Endpoint.new(target).run

        raise WebmentionEndpointError unless url

        say_success(url)
      rescue Error => e
        say_failure(e)
      end

      desc 'send <source> <target>', 'Send a webmention from <source> URL to <target> URL'
      def send(source, target)
        response = Commands::Send.new(source, target).run

        raise WebmentionEndpointError unless response

        status = response.status
        location = response.headers[:location]

        raise WebmentionSendError, status unless status.success?

        say_success(response.code == 201 && location ? location : status)
      rescue Error => e
        say_failure(e)
      end

      desc 'verify <source> <target>', 'Verify <source> URL links to <target> URL'
      option :strict, type: :boolean, desc: 'Enable or disable strict URL matching', default: true
      def verify(source, target)
        verified = Commands::Verify.new(source, target, options[:strict]).run

        raise WebmentionVerificationError, verified unless verified

        say_success(verified)
      rescue Error => e
        say_failure(e)
      end

      desc '--version', 'Print version information'
      def __version
        say "webmention-cli version #{Webmention::CLI::VERSION}"
      end

      no_commands do
        def say_failure(message)
          say message, :red
          exit 1
        end

        def say_success(message)
          say message, :green
          exit 0
        end
      end

      def self.exit_on_failure?
        true
      end
    end
  end
end
