# frozen_string_literal: true

module Yadisk
  class Client
    class Response
      attr_accessor :request,
                    :status_code,
                    :status_reason,
                    :headers,
                    :body

      class << self
        def build(&block)
          resp = new
          yield resp
          resp
        end
      end
    end
  end
end
