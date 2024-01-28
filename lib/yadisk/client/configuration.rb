# frozen_string_literal: true

module Yadisk
  class Client
    class Configuration
      attr_accessor :oauth_token,
                    :faraday_request_options,
                    :faraday_logger

      def initialize(oauth_token: nil)
        @oauth_token = oauth_token
      end

      def self.build(&block)
        config = self.new
        block.call(config)
        config
      end
    end
  end
end
