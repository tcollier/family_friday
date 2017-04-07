require_relative 'minimal_unique_strings'

module FamilyFriday
  # Acts as a hash of employee to unique nick name
  class NickNameMap
    def initialize(employees:)
      @employees = employees
    end

    def [](employee)
      map[employee]
    end

    private

    attr_reader :employees

    # @return [Hash<Employee, String>] a map from employee to the minimal
    #   unique name.
    def map
      @map ||= {}.tap do |hash|
        employees_by_first_name.each do |first_name, similar_employees|
          if similar_employees.length == 1
            # If an employee has a unique first name, then we can just refer
            # to them by that.
            hash[similar_employees[0]] = first_name
          else
            # Otherwise, find the fewest characters of the last names of the
            # employees with the same first name such that each set uniquely
            # identifies that employee. E.g. "John Collins" and "John Cooper"
            # would be identified by "John Col." and "John Coo," respectively.
            minimal_last_names = MinimalUniqueStrings.map(
              similar_employees.map(&:last_name)
            )
            similar_employees.each do |employee|
              hash[employee] =
                "#{first_name} #{minimal_last_names[employee.last_name]}."
            end
          end
        end
      end
    end

    # @return [Hash<String, Array<Employee>>] a map where the keys are the
    #   first names of all employees and the values are arrays of employees
    #   with that first name
    def employees_by_first_name
      employees.map.with_object({}) do |employee, hash|
        hash[employee.first_name] ||= []
        hash[employee.first_name] << employee
      end
    end
  end

  private_constant :NickNameMap
end
