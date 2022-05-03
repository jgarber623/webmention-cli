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
               Webmention::Verification::InvalidURIError => e
          raise ArgumentError, e
        rescue Webmention::Verification::WebmentionVerificationError => e
          raise WebmentionVerificationError, e
        end
      end
    end
  end
end
