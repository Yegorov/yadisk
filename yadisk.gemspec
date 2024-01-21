#!/usr/bin/env gem build
# encoding: utf-8

require_relative 'lib/yadisk/version'

Gem::Specification.new do |s|
  s.name = 'yadisk'
  s.version = Yadisk::VERSION
  s.license = 'MIT'

  s.date = '2018-01-25'

  s.authors = ["Artem Yegorov"]
  s.email = 'yegorov0725@yandex.ru'
  s.description = "Command line tool for download file from Yandex.Disk through share link"
  s.summary = "Download file from Yandex.Disk through share link"
  s.homepage = 'https://github.com/yegorov/yadisk'

  s.files = Dir.glob("{bin,lib,docs}/**/*") + %w(Dockerfile README.md LICENSE)
  s.executables << 'yadisk'

  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 3.0'

  s.add_runtime_dependency 'faraday', "~> 2.0", "< 3"

  s.add_development_dependency 'rspec', '~> 3.9', '< 4.0'
  s.add_development_dependency 'coveralls_reborn'
  s.add_development_dependency 'simplecov'
end

