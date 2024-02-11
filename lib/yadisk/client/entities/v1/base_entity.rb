# frozen_string_literal: true

require 'json'

module Yadisk
  class Client
    module Entities
      module V1
        class BaseEntity
          attr_reader :response, :payload

          def initialize(response, payload = nil)
            @response = response
            @payload = payload || response&.parsed_body
          end

          def to_s
            simple_format
          end

          def inspect
            to_s
          end

          def simple_format
            JSON.pretty_generate(payload)
          end
        end
      end
    end
  end
end
