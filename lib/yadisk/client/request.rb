# frozen_string_literal: true

require 'uri'

module Yadisk
  class Client
    class Request
      include Curlify
      include HttpFaraday

      attr_accessor :config,
                    :method,
                    :headers,
                    :url,
                    :query,
                    :body,
                    :file_io,
                    :filepath,
                    :filename,
                    :file_type

      def initialize(**params)
        @config = params[:config] || Client.configuration
        @method = params[:method]
        @headers = params[:headers]
        @url = params[:url]
        @query = params[:query]
        @body = params[:body]
        @file_io = params[:file_io]
        @filepath = params[:filepath]
        @filename = params[:filename]
        @file_type = params[:file_type]
      end

      class << self
        def build(**params, &block)
          req = new(**params)
          yield req
          req
        end

        def get(url:, query: nil, headers: {})
          build(method: :get) do |r|
            r.url = url
            r.headers = headers
            r.query = query
          end
        end

        def post(url:, query: nil, headers: {}, body:)
          build(
            method: :post,
            url: url,
            query: query,
            headers: headers,
            body: body
          )
        end

        def patch(url:, query: nil, headers: {}, body:)
          build(
            method: :patch,
            url: url,
            query: query,
            headers: headers,
            body: body
          )
        end

        def put(url:, query: nil, headers: {}, body:)
          build(
            method: :put,
            url: url,
            query: query,
            headers: headers,
            body: body
          )
        end

        def delete(url:, query: nil, headers: {}, body:)
          build(
            method: :delete,
            url: url,
            query: query,
            headers: headers,
            body: body
          )
        end
      end

      def call
        perform_simple_request
      end

      def to_s
        to_curl
      end

      def inspect
        to_s
      end
    end
  end
end
