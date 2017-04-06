require_relative 'config'

module Commando
  # Manage the global CLI configuration and provide access to the rest of the
  # app
  module Action
    # Initialize and configure the global config object
    def self.configure(&block)
      @config = Config.new
      yield @config
    end

    # @return [Array<String>] the list of all configured actions.
    def self.commands
      @config.commands
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
    # string and the description
    def self.each_description(&block)
      return unless @config
      @config.each_description(&block)
    end
  end
end
