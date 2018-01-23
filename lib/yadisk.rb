# encoding: utf-8

require 'cgi'
require 'cgi/util'
require 'uri'
require 'io/console'
require 'json'

module Yadisk
  class Main
    BASE_URL = 'https://cloud-api.yandex.net:443/v1/disk/public/resources/download?public_key='
    def download(url, folder: './')
      enc_url = CGI::escape(url)

      puts "wget -qO - #{BASE_URL}#{enc_url}"
      res = IO.popen("wget -qO - #{BASE_URL}#{enc_url}").read
      json_res = JSON.parse(res)
      download_url = json_res['href']
      filename = CGI::parse(URI(download_url).query)["filename"][0]
      folder = folder + "/" if not folder.end_with?('/')

      system("wget '#{download_url}' -O '#{folder}#{filename}'")
    end
  end
end
