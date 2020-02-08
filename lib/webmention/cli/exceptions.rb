module Webmention
  module CLI
    class Error < RuntimeError; end

    class ArgumentError < Error; end

    class WebmentionEndpointError < Error
      def initialize(msg = 'No Webmention endpoint found')
        super(msg)
      end
    end

    class WebmentionSendError < Error; end

    class WebmentionVerificationError < Error; end
  end
end
