# frozen_string_literal: true

module Yadisk
  class Client
    module Resources
      class V1
        class Disk < Resource
          def path = 'disk'

          def call
            # Create Request
            url = to_url
            headers = default_headers
            puts url
            puts headers
            puts client.config.oauth_token
            # headers = to_headers
            # Request.new(method: :get, url: url, headers: headers, query: query, body: body)
            Response.new # TODO
          end
        end
      end
    end
  end
end

