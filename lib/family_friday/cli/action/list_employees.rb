require_relative 'base'

module FamilyFriday
  module Cli
    module Action
      # List all of the employee in the application data store
      class ListEmployees < Base
        def perform
          employees = FamilyFriday.application.employee_store.all
          if employees.length == 0
            output.puts '<no employees>'
          else
            employees.each do |employee|
              output.puts "#{employee.first_name} #{employee.last_name}"
            end
          end
        end

        def self.description
          'List all employees'
        end
      end
    end
  end
end
