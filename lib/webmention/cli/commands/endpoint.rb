module Webmention
  module CLI
    module Commands
      class Endpoint
        def initialize(url)
          @url = url
        end

        def run
          IndieWeb::Endpoints.get(@url)[:webmention]
        rescue IndieWeb::Endpoints::ArgumentError,
               IndieWeb::Endpoints::InvalidURIError => exception
          raise ArgumentError, exception
        rescue IndieWeb::Endpoints::IndieWebEndpointsError => exception
          raise WebmentionEndpointError, exception
        end
      end
    end
  end
end
