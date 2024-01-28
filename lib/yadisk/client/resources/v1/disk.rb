# frozen_string_literal: true

module Yadisk
  class Client
    module Resources
      class V1
        class Disk < Resource
          include HttpHeaders

          def path = 'disk'

          def info(fields: nil)
            url = to_url
            query = { "fields" => fields }.compact
            headers = build_headers
            req = build_request(method: :get) do |r|
              r.url = url
              r.query = query
              r.headers = headers
            end
            resp = req.()

          end
        end
      end
    end
  end
end

