module FamilyFriday
  # Manage access to the underlying persistence store for employees.
  class EmployeeStore
    def initialize(database:)
      @database = database
    end

    # @param employee [Employee] the employee to persist in the store
    def add(employee)
      database.execute(
        'INSERT INTO employees (first_name, last_name, team) VALUES (?, ?, ?)',
        [employee.first_name, employee.last_name, employee.team]
      )
    end

    # @return [Array<Employee>] all employees that have been persisted,
    #   ordered by first_name, then last_name
    def all
      results = database.execute <<-SQL
        SELECT first_name, last_name, team
        FROM employees
        ORDER BY first_name, last_name
      SQL

      results.map do |row|
        Employee.new(first_name: row[0], last_name: row[1], team: row[2])
      end
    end

    # @return [Integer] the number of employees that have been persisted in
    #   the store.
    def size
      results = database.execute('SELECT COUNT(1) FROM employees')
      row = results.first
      row.first
    end

    private

    attr_reader :database
  end
end
