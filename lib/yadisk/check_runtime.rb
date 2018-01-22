require "io/console"

module Yadisk
  class CheckRuntime
    def self.check_wget
      output = IO.popen("which wget").read
      if output.empty?
        puts "Please install wget or add it to 'PATH' and try again\n"
        abort
      end
    end
  end
end

