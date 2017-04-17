require_relative '../grouper'
require_relative '../nick_name_map'
require_relative '../formatter/groups'

module FamilyFriday
  module Action
    # Group all of the employee that are in the application data store
    class GroupEmployees
      def initialize(employee_store:, output: $stdout)
        @employee_store = employee_store
        @output = output
      end

      def perform(args:)
        employees = employee_store.all
        if employees.length == 0
          output.puts '<no employees>'
        else
          nick_names = NickNameMap.new(employees: employees)
          groups = Grouper.new(items: employees).groups
          formatter =
            Formatter::Groups.new(groups: groups, nick_names: nick_names)
          output.puts formatter.to_s
        end
      end

      private

      attr_reader :employee_store, :output
    end
  end
end
