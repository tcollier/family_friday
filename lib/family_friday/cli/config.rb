module FamilyFriday
  module Cli
    ActionConfig = Struct.new(:action_class, :description)

    # Manage the configuration for the actions available to the CLI
    class Config
      def initialize
        @mapping = {}
      end

      # Register a new command/action to be available to the CLI
      #
      # @param command [String] the string that a user will type to execute the
      #   action, e.g. "help" for the command the will print out help info.
      # @param action_class [Class] the class that will execute the logic for
      #   the given command.
      def add(command, action_class, description)
        mapping[command] = ActionConfig.new(action_class, description)
      end

      # @return [Array<String>] the list of all configured actions.
      def commands
        @mapping.keys
      end

      # @param command [String] the command to find an action class for.
      # @return [Class] the action class that is registered for the command,
      #   nil if none is registered.
      def lookup(command)
        mapping[command]&.action_class
      end

      # Iterate through each of the registered commands, yielding the command
      # string and the description
      def each_description(&block)
        mapping.each do |command, action_config|
          yield command, action_config.description
        end
      end

      private

      attr_reader :mapping
    end

    private_constant :Config
  end
end
