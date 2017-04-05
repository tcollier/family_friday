require_relative '../quit_exception'

module FamilyFriday
  module Cli
    module Action
      # Action to exit out of the CLI
      module Quit
        def self.perform(args:, output: $stdout)
          raise QuitException
        end
      end
    end
  end
end
