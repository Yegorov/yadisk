# frozen_string_literal: true

module Yadisk
  class Client
    module Resources
      class Resource
        attr_reader :client, :parent_resource

        def initialize(client, parent_resource = nil)
          @client = client
          @parent_resource = parent_resource
        end

        def path = nil

        def paths = parent_resource.paths + [path]

        def to_url = "#{parent_resource.to_url}/#{path}"

        private

        def default_headers
          {
            "Content-Type" => "application/json",
            "User-Agent" => user_agent
          }
        end

        def user_agent
          "Yadisk/#{Yadisk::VERSION}"
        end
      end
    end
  end
end
