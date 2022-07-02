# encoding: utf-8

require 'io/console'

require 'yadisk/os'

module Yadisk
  class CheckRuntime
    def self.check_wget
      if Yadisk::OS.windows?
        output = IO.popen("wget").read
        abort! unless $?.to_i == 0
        return
      end

      output = IO.popen("which wget").read
      abort! if output.empty?
    end
    
    def self.abort!
      puts "Please install wget or add it to 'PATH' and try again\n"
      abort
    end
  end
end

