require_relative 'base'

require_relative '../../app/grouper'

module FamilyFriday
  module Cli
    module Action
      # Group all of the employee that are in the application data store
      class GroupEmployees < Base
        def perform
          employees = FamilyFriday.application.employee_store.all
          if employees.length == 0
            output.puts '<no employees>'
          else
            groups = FamilyFriday::App::Grouper.new(items: employees).groups
            output.puts
            groups.each.with_index do |employees, index|
              output.puts "     Group #{index + 1}"
              output.puts "-----------------"
              employees.each do |employee|
                output.puts " #{employee.first_name} #{employee.last_name}"
              end
              output.puts
            end
          end
        end

        def self.description
          'Group all employees into randomized groups'
        end
      end
    end
  end
end
