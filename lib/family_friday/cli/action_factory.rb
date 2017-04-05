require_relative 'action'

module FamilyFriday
  module Cli
    # A utility for obtaining instances of actions from a given command and list
    # of arguments
    module ActionFactory
      # @param command [String] the command to get an action instance for.
      # @param args [Array<String>] the list of arguments for the command.
      # @param output [IO] the stream any actions should write messages to.
      # @return [Action::Base|nil] the action instance associated with the
      #   command or nil if no action is registered.
      def self.make(command, args, output: $stdout)
        action_class = Action.lookup(command)
        action_class && action_class.new(args: args, output: output)
      end
    end

    private_constant :ActionFactory
  end
end
