require_relative '../nick_name_map'

module FamilyFriday
  module Action
    # List all of the employee in the application data store
    class ListEmployees
      def initialize(employee_store:, output: $stdout)
        @employee_store = employee_store
        @output = output
      end

      def perform(args:)
        employees = employee_store.all
        if employees.length == 0
          output.puts '<no employees>'
        else
          map = NickNameMap.new(employees: employees)
          employees.each do |employee|
            nick_name = map[employee]
            output.puts "#{employee.first_name} #{employee.last_name} (#{nick_name})"
          end
        end
      end

      private

      attr_reader :employee_store, :output
    end
  end
end
