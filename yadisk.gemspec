#!/usr/bin/env gem build
# encoding: utf-8

require_relative 'lib/yadisk/version'

Gem::Specification.new do |s|
  s.name = 'yadisk'
  s.version = Yadisk::VERSION
  s.date = '2018-01-25'
  s.summary = "Download file from Yandex.Disk through share link"
  s.description = "Command line tool for download file from Yandex.Disk through share link"
  s.author = "Artem Yegorov"
  s.email = 'yegorov0725@yandex.ru'
  s.files = ["lib/yadisk.rb", "lib/yadisk/check_runtime.rb", "lib/yadisk/version.rb"]
  s.platform = Gem::Platform::RUBY
  s.executables << 'yadisk'
  s.add_development_dependency 'rspec', ['~> 3.7.0', '< 4.0']
  s.homepage = 'https://github.com/yegorov/yadisk'
  s.license = 'MIT'
end

