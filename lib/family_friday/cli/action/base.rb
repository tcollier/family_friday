module FamilyFriday
  module Cli
    module Action
      # The base class for all actions. The following methods must be
      # overridden in subclasses
      #
      #   * #perform
      #
      class Base
        # @param args [Array<String>] the list of arguments for the action.
        # @param output [IO] the stream any actions should write messages to.
        def initialize(args:, output: $stdout)
          @args = args
          @output = output
        end

        # Perform the logic needed to fulfill the command
        def perform
          super
        end

        def ==(other)
          return false unless other.is_a?(self.class)
          hash == other.hash
        end

        alias_method :eql?, :==

        def hash
          args
        end

        protected

        attr_reader :args, :output
      end
    end
  end
end
