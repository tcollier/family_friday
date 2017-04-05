require_relative 'base'

module FamilyFriday
  module Cli
    module Action
      # Action that prints out all available commands
      class Help < Base
        def perform
          output.puts "Valid commands are"
          Action.each_description do |command, description|
            output.puts "  * #{command} - #{description}"
          end
        end
      end
    end
  end
end
