require_relative 'config'

module FamilyFriday
  module Cli
    # Manage the global CLI configuration and provide access to the rest of the
    # app
    module Action
      # Initialize and configure the global config object
      def self.configure(&block)
        @config = Config.new
        yield @config
      end

      # Look up the action class for the given command from the global config
      #
      # @param command [String] the command to find an action class for.
      # @return [Class] the action class that is registered for the command,
      #   nil if none is registered.
      def self.lookup(command)
        return unless @config
        @config.lookup(command)
      end

      # Iterate through each of the registered commands, yielding the command
      # string and the action class
      def self.each(&block)
        return unless @config
        @config.each(&block)
      end
    end
  end
end
