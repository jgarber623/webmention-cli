# frozen_string_literal: true

module Webmention
  module CLI
    class Runner < Thor
      include Thor::Actions

      package_name "Webmention"

      map ["-v", "--version"] => :version

      # :nocov:
      def self.exit_on_failure?
        true
      end
      # :nocov:

      desc "endpoint <target>", "Discover the Webmention endpoint for <target> URL"
      def endpoint(target)
        url = Webmention::Url.new(target)

        exit 1 unless url.webmention_endpoint?

        say url.webmention_endpoint
      end

      desc "send <source> <target>", "Send a webmention from <source> URL to <target> URL"
      option :vouch, desc: "Submit a <vouch> URL"
      def send(source, target)
        response = Webmention.send_webmention(source, target, vouch: options[:vouch])

        exit 1 unless response.ok?

        code = response.code
        location = response.headers["Location"]

        say(code == 201 && location ? location : "#{code} #{response.reason}")

        exit 1 unless code.between?(200, 299)
      end

      desc "verify <source> <target>", "Verify that <source> URL links to <target> URL"
      option :vouch, desc: "Verify that <vouch> URL mentions the <source> URL domain"
      def verify(source, target)
        verification = Webmention.verify_webmention(source, target, vouch: options[:vouch])

        exit 1 unless verification.verified?
      end

      desc "version", "Print version information"
      def version
        say "webmention-cli version #{Webmention::CLI::VERSION}"
      end
    end
  end
end
