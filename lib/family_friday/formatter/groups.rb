module FamilyFriday
  module Formatter
    class Groups
      def initialize(groups:, nick_names:)
        @groups = groups
        @nick_names = nick_names
      end

      def to_s
        str = "\n"
        groups.each.with_index do |employees, index|
          str << "   Group #{index + 1}\n"
          str << "-------------\n"
          employees.each do |employee|
            str << " #{nick_names[employee]}\n"
          end
          str << "\n"
        end

        str
      end

      private

      attr_reader :groups, :nick_names
    end
  end
end
