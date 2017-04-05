module FamilyFriday
  module App
    # The model to represent the employees
    class Employee
      attr_reader :first_name, :last_name

      def initialize(first_name:, last_name:)
        @first_name = first_name
        @last_name = last_name
      end

      def ==(other)
        return false unless other.is_a?(self.class)
        hash == other.hash
      end

      alias_method :eql?, :==

      def hash
        [first_name, last_name].hash
      end
    end
  end
end
