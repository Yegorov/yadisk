# encoding: utf-8

module Yadisk
  class OS
    def self.windows?
      RUBY_PLATFORM =~ /win|mingw/
    end
  end
end
