# encoding: utf-8

require 'cgi'
require 'cgi/util'
require 'uri'
require 'io/console'
require 'json'
require 'net/http'

module Yadisk
  class Main
    BASE_URL = 'https://cloud-api.yandex.net:443/v1/disk/public/resources/download?public_key='
    def download(url, folder: ".#{File::SEPARATOR}", wget_options: nil)
      enc_url = CGI::escape(url)
      response = Net::HTTP.get(URI("#{BASE_URL}#{enc_url}"))
      json_res = JSON.parse(response)
      download_url = json_res['href']
      filename = CGI::parse(URI(download_url).query)["filename"][0]
      folder = folder + File::SEPARATOR if not folder.end_with?(File::SEPARATOR)

      system("wget '#{download_url}' -O '#{folder}#{filename}' #{wget_options}")
    end
  end
end
