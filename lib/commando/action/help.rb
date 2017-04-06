require_relative '../action'

module Commando
  module Action
    # Action that prints out all available commands
    module Help
      def self.perform(args:, output: $stdout)
        output.puts "Valid commands are"
        Action.each_description do |command, description|
          output.puts "  * #{command} - #{description}"
        end
      end
    end
  end
end
