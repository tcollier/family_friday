require_relative '../employee'

module FamilyFriday
  module Action
    # Adds a employee to the application data store
    class AddEmployee
      def initialize(output: $stdout)
        @output = output
      end

      def perform(args:)
        if args.length != 2
          raise ArgumentError, 'You must supply a first and last name'
        end

        employee = Employee.new(
          first_name: args[0],
          last_name: args[1]
        )
        FamilyFriday.employee_store.add(employee)
        output.puts(
          "Added employee #{employee.first_name} #{employee.last_name}"
        )
      end

      private

      attr_reader :output
    end
  end
end
