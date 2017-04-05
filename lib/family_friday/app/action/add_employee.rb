require_relative '../../cli/validation_error'
require_relative '../employee'

module FamilyFriday
  module App
    module Action
      # Adds a employee to the application data store
      module AddEmployee
        def self.perform(args:, output: $stdout)
          if args.length != 2
            raise Cli::ValidationError, 'You must supply a first and last name'
          end

          employee = FamilyFriday::App::Employee.new(
            first_name: args[0],
            last_name: args[1]
          )
          FamilyFriday.application.employee_store.add(employee)
          output.puts(
            "Added employee #{employee.first_name} #{employee.last_name}"
          )
        end
      end
    end
  end
end
