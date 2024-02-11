# frozen_string_literal: true

module Yadisk
  class Client
    module Entities
      module V1
        class Error < BaseEntity
          # https://yandex.ru/dev/disk-api/doc/ru/reference/response-objects#error
          def message = payload&.dig('message')
          def description = payload&.dig('description')
          def error = payload&.dig('description')
        end
      end
    end
  end
end
