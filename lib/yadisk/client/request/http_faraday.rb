module Yadisk
  class Client
    class Request
      module HttpFaraday
        def perform_simple_request
          faraday_resp = http_faraday.send(method) do |req|
            req.url url
            req.params = query if !query.nil?
            req.headers = headers if !headers.nil? && !headers.empty?
            req.body = body if !body.nil?
          end

          Response.build do |resp|
            resp.request = self
            resp.status_code = faraday_resp.env.status
            resp.status_reason = faraday_resp.env.reason_phrase
            resp.headers = faraday_resp.headers
            resp.body = faraday_resp.body
          end
        end

        def http_faraday
          @_http_faraday ||= Faraday.new(http_faraday_connection_options) do |builder|
            http_faraday_build(builder)
          end
        end

        def http_faraday_connection_options
          {
            request: {
              timeout: 30
            }.merge(config.faraday_request_options || {})
          }
        end

        def http_faraday_build(builder)
          if config.faraday_logger
            case config.faraday_logger
              when Array
                builder.response :logger, *config.faraday_logger
              else
                builder.response :logger, config.faraday_logger
              end
          end
        end
      end
    end
  end
end
