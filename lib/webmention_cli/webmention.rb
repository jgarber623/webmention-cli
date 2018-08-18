module WebmentionCLI
  class Webmention < Thor
    def self.exit_on_failure?
      true
    end

    desc 'endpoint <url>', 'Discover webmention endpoint for <url>'
    def endpoint(url)
      result = ::Webmention::Endpoint.discover(url)

      puts result if result

      exit(result ? true : false)
    rescue ::Webmention::Endpoint::ArgumentError, ::Webmention::Endpoint::InvalidURIError
      raise Thor::MalformattedArgumentError, "ERROR: Expected '#{url}' to be an absolute URI (e.g. https://example.com)"
    end

    # desc 'send <source> <target>', 'Send a webmention from <source> URL to <target> URL'
    # def send(source, target)
    #   puts source
    #   puts target
    # end

    desc 'verify <source> <target>', 'Verify <source> URL links to <target> URL'
    option :strict, type: :boolean, desc: 'Enable or disable strict URL matching', default: true
    def verify(source, target)
      result = ::Webmention::Verification::Client.new(source, target, strict: options[:strict]).verified?

      if result
        puts "SUCCESS: #{source} links to #{target}"
      else
        puts "ERROR: #{source} does not link to #{target}"
      end

      exit(result)
    rescue ::Webmention::Verification::ArgumentError
      raise Thor::MalformattedArgumentError, "ERROR: Expected '#{source}' and '#{target}' to be absolute URIs (e.g. https://example.com)"
    end
  end
end
