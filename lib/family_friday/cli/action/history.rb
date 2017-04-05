require_relative 'base'

module FamilyFriday
  module Cli
    module Action
      # Action that prints out all available commands
      class History < Base
        def perform
          max_digits = Math.log(Readline::HISTORY.size, 10).ceil
          Readline::HISTORY.each.with_index do |history, index|
            line_no = (index + 1).to_s.rjust(max_digits, ' ')
            output.puts " #{line_no}\t#{history}"
          end
        end

        def self.description
          'Print the history of commands'
        end
      end
    end
  end
end
