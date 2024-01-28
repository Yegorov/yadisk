# frozen_string_literal: true

module Yadisk
  class Client
    module Resources
      class V1 < Resource
        BASE_URL = 'https://cloud-api.yandex.net'

        def initialize(*args)
          super
          @disk = Disk.new(client, self)
        end

        def base_url = BASE_URL

        def path = 'v1'

        def paths = [path]

        def to_url = "#{base_url}/#{path}"

        def disk = @disk
      end
    end
  end
end
