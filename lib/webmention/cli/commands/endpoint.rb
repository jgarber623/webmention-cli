# frozen_string_literal: true

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
               IndieWeb::Endpoints::InvalidURIError => e
          raise ArgumentError, e
        rescue IndieWeb::Endpoints::IndieWebEndpointsError => e
          raise WebmentionEndpointError, e
        end
      end
    end
  end
end
