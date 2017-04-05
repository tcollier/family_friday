module FamilyFriday
  module Cli
    module Action
      # Counts the number of employee in the application data store
      module CountEmployees
        def self.perform(args:, output: $stdout)
          output.puts FamilyFriday.application.employee_store.size
        end
      end
    end
  end
end
