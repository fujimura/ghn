class Ghn
  class Command
    def self.commands
      ['list']
    end

    attr_reader :command
    attr_reader :args

    def initialize(argv)
      @argv = argv
      @valid = false
      process!
    end

    def process!
      @command = @argv.first
      if self.class.commands.include?(@command)
        @valid = true
        @args = @argv.drop(1)
      else
        @valid = false
      end
    end

    def valid?
      !!@valid
    end

    def print_invalid
      if @command.nil? || @command.empty?
        print_empty_command
      else
        print_invalid_command
      end
    end

    def print_empty_command
      puts "** No command"
    end

    def print_invalid_command
      puts "** Invalid command `#{@command}`"
    end
  end
end
