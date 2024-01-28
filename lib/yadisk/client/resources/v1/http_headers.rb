# frozen_string_literal: true

module Yadisk
  class Client
    module Resources
      class V1
        module HttpHeaders
          def user_agent
            "#{Yadisk::NAME}/#{Yadisk::VERSION}"
          end

          def oauth_token
            client.config.oauth_token
          end

          def default_headers
            {
              "Content-Type" => "application/json",
              "User-Agent" => user_agent
            }
          end

          def auth_headers
            {
              "Authorization" => "OAuth #{oauth_token}"
            }
          end

          def build_headers(headers = {}, with_auth: true)
            default_headers.then { |h| with_auth ? h.merge(auth_headers) : h }.merge(headers)
          end
        end
      end
    end
  end
end
