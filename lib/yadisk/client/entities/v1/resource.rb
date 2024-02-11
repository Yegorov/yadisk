# frozen_string_literal: true

module Yadisk
  class Client
    module Entities
      module V1
        # @see https://yandex.ru/dev/disk-api/doc/ru/reference/response-objects#resource
        # @see https://yandex.ru/dev/disk/poligon/
        class Resource < BaseEntity
          # Статус проверки антивирусом
          # @return [Hash, nil]
          def antivirus_status = payload&.dig('antivirus_status')

          # Идентификатор ресурса
          # @return [String, nil]
          def resource_id = payload&.dig('resource_id')

          # @return [ShareInfo, nil]
          def share = payload&.dig('share').then { |p| p ? ShareInfo.new(nil, p) : nil }

          # Ключ опубликованного ресурса
          # @return [String, nil]
          def public_key = payload&.dig('public_key')

          # @return [ResourceList, nil]
          def _embedded = payload&.dig('_embedded').then { |p| p ? ResourceList.new(nil, p) : nil }

          # @return [Exif, nil]
          def exif = payload&.dig('exif').then { |p| p ? Exif.new(nil, p) : nil }

          # Дата создания фото или видео файла
          # @return [Time, nil]
          def photoslice_time = payload&.dig('photoslice_time').then { |v| v ? Time.parse(v) : nil }

          # Имя
          # @return [String, nil]
          def name = payload&.dig('name')

          # Дата создания
          # @return [Time, nil]
          def created = payload&.dig('created').then { |v| v ? Time.parse(v) : nil }

          # Пользовательские атрибуты ресурса
          # @return [Hash, nil]
          def custom_properties = payload&.dig('custom_properties')

          # Публичный URL
          # @return [String, nil]
          def public_url = payload&.dig('public_url')

          # URL для скачивания файла
          # @return [String, nil]
          def file = payload&.dig('file')

          # Путь к ресурсу до перемещения в Корзину.
          # Включается в ответ только для запроса метаинформации о ресурсе в Корзине.
          # @return [String, nil]
          def origin_path = payload&.dig('origin_path')

          # Дата изменения>
          # @return [Time, nil]
          def modified = payload&.dig('modified').then { |v| v ? Time.parse(v) : nil }

          # Путь к ресурсу
          # @return [String, nil]
          def path = payload&.dig('path')

          # MD5-хэш
          # @return [String, nil]
          def md5 = payload&.dig('md5')

          # SHA256-хэш
          # @return [String, nil]
          def sha256 = payload&.dig('sha256')

          # Тип
          # @return [String]
          def type = payload&.dig('type')

          # MIME-тип файла
          # @return [String, nil]
          def mime_type = payload&.dig('mime_type')

          # Размер файла
          # @return [Integer, nil]
          def size = payload&.dig('size')

          # Определённый Диском тип файла
          # @return [String, nil]
          def media_type = payload&.dig('media_type')

          # URL превью файла
          # @return [String, nil]
          def preview = payload&.dig('preview')

          # Ревизия Диска в которой этот ресурс был изменён последний раз
          # @return [Integer, nil]
          def revision = payload&.dig('revision')

          # Все размеры превью с URL для скачивания
          # @return [Array<Preview>, nil]
          def sizes = payload&.dig('sizes')&.map { |p| Preview.new(nil, p) }

          # @return [CommentIds, nil]
          def comment_ids = payload&.dig('comment_ids').then { |p| p ? CommentIds.new(nil, p) : nil }

          class ShareInfo < BaseEntity
            # Признак того, что папка является корневой в группе
            # @return [Boolean, nil]
            def is_root = payload&.dig('is_root')

            # Признак, что текущий пользователь является владельцем общей папки
            # @return [Boolean, nil]
            def is_owned = payload&.dig('is_owned')

            # Права доступа
            # @return [String, nil]
            def rights = payload&.dig('rights')

            alias_method :root?, :is_root
            alias_method :owned?, :is_owned
          end

          class Exif < BaseEntity
            # Дата съёмки
            # @return [Time, nil]
            def date_time = payload&.dig('date_time').then { |v| v ? Time.parse(v) : nil }

            # Координата съемки (долгота)
            # @return [Hash, nil]
            def gps_longitude = payload&.dig('gps_longitude')

            # Координата съемки (широта)
            # @return [Hash, nil]
            def gps_latitude = payload&.dig('gps_latitude')
          end

          class Preview < BaseEntity
            # Ссылка на скачивание превью
            # @return [String, nil]
            def url = payload&.dig('url')

            # Название (размер) превью
            # @return [String, nil]
            def name = payload&.dig('name')
          end

          class CommentIds < BaseEntity
            # Идентификатор комментариев для приватных ресурсов
            # @return [String, nil]
            def private_resource = payload&.dig('private_resource')

            # Идентификатор комментариев для публичных ресурсов
            # @return [String, nil]
            def public_resource = payload&.dig('public_resource')
          end
        end
      end
    end
  end
end
