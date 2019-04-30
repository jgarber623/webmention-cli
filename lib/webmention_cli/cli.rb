module WebmentionCLI
  class CLI < Thor
    def self.exit_on_failure?
      true
    end

    desc 'endpoint <url>', 'Discover webmention endpoint for <url>'
    def endpoint(url)
      endpoint_url = IndieWeb::Endpoints.get(url).webmention

      puts endpoint_url if endpoint_url

      exit(endpoint_url ? true : false)
    rescue IndieWeb::Endpoints::ArgumentError,
           IndieWeb::Endpoints::InvalidURIError
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
      webmention_verified = Webmention::Verification::Client.new(source, target, strict: options[:strict]).verified?

      if webmention_verified
        puts "SUCCESS: #{source} links to #{target}"
      else
        puts "ERROR: #{source} does not link to #{target}"
      end

      exit(webmention_verified)
    rescue Webmention::Verification::ArgumentError
      raise Thor::MalformattedArgumentError, "ERROR: Expected '#{source}' and '#{target}' to be absolute URIs (e.g. https://example.com)"
    end
  end
end
