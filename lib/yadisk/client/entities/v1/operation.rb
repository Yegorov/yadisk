# frozen_string_literal: true

module Yadisk
  class Client
    module Entities
      module V1
        class Operation < BaseEntity
          # https://yandex.ru/dev/disk-api/doc/ru/reference/response-objects#operation

          def status = payload&.dig('status')
        end
      end
    end
  end
end
