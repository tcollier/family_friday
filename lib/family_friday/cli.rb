require_relative 'cli/interpreter'
require_relative 'cli/quit_exception'
require_relative 'cli/validation_error'

module FamilyFriday
  # Entry point for the Command Line Interface (CLI).
  #
  # Present the user with a text-based interface, where a prompt is printed,
  # then commands are read from stardard in, then executed. This process is
  # repeated indefinitely until the user give either the "quit" command, or
  # presses <CMD>+D.
  module Cli
    WELCOME_MESSAGE =
      'Welcome the the Family Friday app! Type "help" to list commands'.freeze
    PROMPT = '> '.freeze

    # Begin the prompt, get input, process loop.
    def self.start(output: $stdout)
      output.puts WELCOME_MESSAGE
      quit = false

      loop do
        output.print PROMPT
        output.flush

        line = gets&.chomp

        if line.nil?
          # When the user presses <CMD>+D, this comes through as nil. In that
          # case we want to exit
          output.puts
          break
        elsif line.strip != ''
          # When the user enters a non-empty string, pass the line to the
          # interpreter and handle the command.
          #
          # If the user enters an empty string (e.g. "" or "   "), we simply
          # go back to the top of the loop to print out the prompt and wait
          # for the next command.
          interpreter = Interpreter.new(input: line, output: output)

          begin
            interpreter.interpret
          rescue ValidationError => error
            output.puts "Error: #{error}"
          rescue QuitException
            break
          end
        end
      end
    end
  end
end
