# frozen_string_literal: true

module Yadisk
  class Client
    module Entities
      module V1
        class Link < BaseEntity
          # https://yandex.ru/dev/disk-api/doc/ru/reference/response-objects#link

          def href = payload&.dig('href')
          def method = payload&.dig('method')
          def templated = payload&.dig('templated')
        end
      end
    end
  end
end
