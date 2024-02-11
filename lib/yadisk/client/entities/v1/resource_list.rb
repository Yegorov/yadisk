# frozen_string_literal: true

module Yadisk
  class Client
    module Entities
      module V1
        # @see https://yandex.ru/dev/disk-api/doc/ru/reference/response-objects#resourcelist
        # @see https://yandex.ru/dev/disk/poligon/
        class ResourceList < BaseEntity
          # Поле, по которому отсортирован список
          # @return [String, nil]
          def sort = payload&.dig('sort')

          # Ключ опубликованной папки, в которой содержатся ресурсы из данного списка.
          # Включается только в ответ на запрос метаинформации о публичной папке.
          # @return [String, nil]
          def public_key = payload&.dig('public_key')

          # Элементы списка / Массив ресурсов (Resource), содержащихся в папке.
          # Вне зависимости от запрошенной сортировки, ресурсы в массиве упорядочены по их виду:
          # сначала перечисляются все вложенные папки, затем — вложенные файлы.
          # @return [Array<Resource>, nil]
          def items = payload&.dig('items')&.map { |p| Resource.new(nil, p) }

          # Количество элементов на странице
          # @return [Integer, nil]
          def limit = payload&.dig('limit')

          # Смещение от начала списка
          # @return [Integer, nil]
          def offset = payload&.dig('offset')

          # Путь к ресурсу, для которого построен список
          # @return [String]
          def path = payload&.dig('path')

          # Общее количество элементов в списке
          # @return [Integer, nil]
          def total = payload&.dig('total')
        end
      end
    end
  end
end
