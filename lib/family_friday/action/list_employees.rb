module FamilyFriday
  module Action
    # List all of the employee in the application data store
    module ListEmployees
      def self.perform(args:, output: $stdout)
        employees = FamilyFriday.application.employee_store.all
        if employees.length == 0
          output.puts '<no employees>'
        else
          employees.each do |employee|
            output.puts "#{employee.first_name} #{employee.last_name}"
          end
        end
      end
    end
  end
end
