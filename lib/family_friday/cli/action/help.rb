require_relative 'base'

module FamilyFriday
  module Cli
    module Action
      # Action that prints out all available commands
      class Help < Base
        def perform
          output.puts "Valid commands are"
          Action.each do |command, action_class|
            output.puts "  * #{command} - #{action_class.description}"
          end
        end

        def self.description
          'Print this message'
        end
      end
    end
  end
end
