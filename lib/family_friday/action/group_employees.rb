require_relative '../grouper'
require_relative '../nick_name_map'
require_relative '../formatter/groups'

module FamilyFriday
  module Action
    # Group all of the employee that are in the application data store
    module GroupEmployees
      def self.perform(args:, output: $stdout)
        employees = FamilyFriday.application.employee_store.all
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
    end
  end
end
