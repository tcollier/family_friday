module FamilyFriday
  # The model to represent the employees
  class Employee
    attr_reader :first_name, :last_name, :team

    def initialize(first_name:, last_name:, team:)
      @first_name = first_name
      @last_name = last_name
      @team = team
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      hash == other.hash
    end

    alias_method :eql?, :==

    def hash
      [first_name, last_name, team].hash
    end
  end

  private_constant :Employee
end
