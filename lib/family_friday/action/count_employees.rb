module FamilyFriday
  module Action
    # Counts the number of employee in the application data store
    class CountEmployees
      def initialize(employee_store:, output: $stdout)
        @employee_store = employee_store
        @output = output
      end

      def perform(args:)
        output.puts employee_store.size
      end

      private

      attr_reader :employee_store, :output
    end
  end
end
