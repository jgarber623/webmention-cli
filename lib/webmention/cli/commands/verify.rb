# frozen_string_literal: true

module Webmention
  module CLI
    module Commands
      class Verify
        def initialize(source, target, strict)
          @source = source
          @target = target
          @strict = strict
        end

        def run
          Webmention::Verification.verified?(@source, @target, strict: @strict)
        rescue Webmention::Verification::ArgumentError,
               Webmention::Verification::InvalidURIError => exception
          raise ArgumentError, exception
        rescue Webmention::Verification::WebmentionVerificationError => exception
          raise WebmentionVerificationError, exception
        end
      end
    end
  end
end
