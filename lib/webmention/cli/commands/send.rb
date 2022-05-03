# frozen_string_literal: true

module Webmention
  module CLI
    module Commands
      class Send
        def initialize(source, target)
          @source = source
          @target = target
        end

        def run
          Webmention.send_mention(@source, @target)
        rescue Webmention::ArgumentError,
               Webmention::InvalidURIError => e
          raise ArgumentError, e
        rescue Webmention::WebmentionClientError => e
          raise WebmentionSendError, e
        end
      end
    end
  end
end
