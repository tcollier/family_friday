require_relative 'base'

module FamilyFriday
  module Cli
    module Action
      # Counts the number of employee in the application data store
      class CountEmployees < Base
        def perform
          output.puts FamilyFriday.application.employee_store.size
        end
      end
    end
  end
end
