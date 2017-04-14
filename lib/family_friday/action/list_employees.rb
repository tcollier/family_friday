require_relative '../nick_name_map'

module FamilyFriday
  module Action
    # List all of the employee in the application data store
    module ListEmployees
      def self.perform(args:, output: $stdout)
        employees = FamilyFriday.employee_store.all
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
    end
  end
end
