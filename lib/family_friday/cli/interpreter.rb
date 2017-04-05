require_relative 'action_factory'

module FamilyFriday
  module Cli
    # Interpret a single command from the user.
    class Interpreter
      # @param input [String] the entire command line string.
      # @param output [IO] the stream any actions should write messages to.
      def initialize(input:, output: $stdout)
        @args = input.split(' ')
        @cmd = @args.shift
        @output = output
      end

      # Performs the action (if valid) for the given input command line
      def interpret
        action = ActionFactory.make(cmd, args, output: output)

        if action.nil?
          output.puts %Q(Unrecognized command: #{cmd}. Type "help" for a list of valid commands)
        else
          action.perform
        end
      end

      private

      attr_reader :cmd, :args, :output
    end

    private_constant :Interpreter
  end
end
