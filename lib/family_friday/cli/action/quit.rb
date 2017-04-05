require_relative 'base'

require_relative '../quit_exception'

module FamilyFriday
  module Cli
    module Action
      # Action to exit out of the CLI
      class Quit < Base
        def perform
          raise QuitException
        end

        def self.description
          'Exit the interpreter'
        end
      end
    end
  end
end