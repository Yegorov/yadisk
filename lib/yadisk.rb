# encoding: utf-8
# frozen_string_literal: true

module Yadisk
  require 'yadisk/version'
  require 'yadisk/client'
  require 'yadisk/client/configuration'

  require 'yadisk/client/resources'
  require 'yadisk/client/resources/resource'
  require 'yadisk/client/resources/v1'
  require 'yadisk/client/resources/v1/http_headers'
  require 'yadisk/client/resources/v1/disk'

  require 'yadisk/client/request/curlify'
  require 'yadisk/client/request/http_faraday'
  require 'yadisk/client/request'

  require 'yadisk/client/response'

  require 'yadisk/client/entities'
  require 'yadisk/client/entities/v1'
  require 'yadisk/client/entities/v1/base_entity'
  require 'yadisk/client/entities/v1/error'
  require 'yadisk/client/entities/v1/disk'


  NAME = 'Yadisk'
end
