module FamilyFriday
  module Action
    # Counts the number of employee in the application data store
    class CountEmployees
      def initialize(output: $stdout)
        @output = output
      end

      def perform(args:)
        output.puts FamilyFriday.employee_store.size
      end

      private

      attr_reader :output
    end
  end
end
