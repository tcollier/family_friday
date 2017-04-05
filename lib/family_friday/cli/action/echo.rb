require_relative 'base'

module FamilyFriday
  module Cli
    module Action
      # Simple action that prints the given args.
      class Echo < Base
        def perform
          output.puts args.join(' ')
        end

        def self.description
          'Print the arguments passed in'
        end
      end
    end
  end
end
