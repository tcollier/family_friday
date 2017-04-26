require_relative '../employee'

module FamilyFriday
  module Action
    # Adds a employee to the application data store
    class AddEmployee
      def initialize(employee_store:, output: $stdout)
        @employee_store = employee_store
        @output = output
      end

      def perform(args:)
        if args.length != 3
          raise ArgumentError, 'You must supply a first name, last name and team'
        end

        employee = Employee.new(
          first_name: args[0],
          last_name: args[1],
          team: args[2]
        )
        employee_store.add(employee)
        output.puts(
          "Added employee #{employee.first_name} #{employee.last_name} on #{employee.team}"
        )
      end

      private

      attr_reader :employee_store, :output
    end
  end
end
