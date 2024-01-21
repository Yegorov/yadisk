# frozen_string_literal: true

require 'yadisk/client/configuration'
require 'yadisk/client/resources'
require 'yadisk/client/request'
require 'yadisk/client/response'

module Yadisk
  class Client
    attr_reader :config

    def initialize(config = nil)
      @config = config || self.class.configuration
      @v1 = Resources::V1.new(self)
    end

    class << self
      def configuration
        @_configuration ||= Configuration.new
      end

      def configure
        yield(configuration)
      end

      def default
        new(configuration)
      end
    end

    def v1 = @v1
  end
end
