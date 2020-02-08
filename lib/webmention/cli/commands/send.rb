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
               Webmention::InvalidURIError => exception
          raise ArgumentError, exception
        rescue Webmention::WebmentionClientError => exception
          raise WebmentionSendError, exception
        end
      end
    end
  end
end
