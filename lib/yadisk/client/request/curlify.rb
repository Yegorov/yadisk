module Yadisk
  class Client
    class Request
      module Curlify
        def to_curl
          case method
          when :get
            parts = ["curl -X GET '#{url}'"]
            parts << curl_query_str(indent: 0) if !query.nil? && !query.empty?
            parts << curl_header_str(indent: 2) if !headers.nil? && !headers.empty?
            parts.join(" \\\n#{curl_space_prefix(indent: 2)}")
          end
        end

        def curl_space_prefix(indent: 2)
          "#{' ' * indent}"
        end

        def curl_query_str(indent: 2)
          "#{curl_space_prefix(indent: indent)}-G -d '#{URI.encode_www_form(query)}'"
        end

        def curl_header_str(indent: 2)
          headers
            .each_pair
            .map { |name, value| "-H '#{name}: #{value}'" }
            .join(" \\\n#{curl_space_prefix(indent: indent)}")
        end
      end
    end
  end
end
