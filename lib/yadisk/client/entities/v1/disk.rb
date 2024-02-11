# frozen_string_literal: true

require 'time'

module Yadisk
  class Client
    module Entities
      module V1
        class Disk < BaseEntity
          # https://yandex.ru/dev/disk-api/doc/ru/reference/response-objects#disk

          def paid_max_file_size = payload&.dig('paid_max_file_size')
          def max_file_size = payload&.dig('max_file_size')
          def total_space = payload&.dig('total_space')
          def trash_size = payload&.dig('trash_size')
          def used_space = payload&.dig('used_space')
          def is_paid = payload&.dig('is_paid')
          def reg_time = payload&.dig('reg_time').then { |v| v ? Time.parse(v) : nil }
          def system_folders = payload&.dig('system_folders').then { |p| p ? SystemFolders.new(nil, p) : nil }
          def user = payload&.dig('user').then { |p| p ? User.new(nil, p) : nil }
          def unlimited_autoupload_enabled = payload&.dig('unlimited_autoupload_enabled')
          def revision = payload&.dig('revision')

          class SystemFolders < BaseEntity
            def odnoklassniki = payload&.dig('odnoklassniki')
            def google = payload&.dig('google')
            def instagram = payload&.dig('instagram')
            def vkontakte = payload&.dig('vkontakte')
            def attach = payload&.dig('attach')
            def mailru = payload&.dig('mailru')
            def downloads = payload&.dig('downloads')
            def applications = payload&.dig('applications')
            def facebook = payload&.dig('facebook')
            def social = payload&.dig('social')
            def messenger = payload&.dig('messenger')
            def calendar = payload&.dig('calendar')
            def photostream = payload&.dig('photostream')
            def screenshots = payload&.dig('screenshots')
            def scans = payload&.dig('scans')
          end

          class User < BaseEntity
            def reg_time = payload&.dig('reg_time').then { |v| v ? Time.parse(v) : nil }
            def display_name = payload&.dig('display_name')
            def uid = payload&.dig('uid')
            def country = payload&.dig('country')
            def is_child = payload&.dig('is_child')
            def login = payload&.dig('login')
          end
        end
      end
    end
  end
end
