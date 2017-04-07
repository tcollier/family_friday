require 'terminal-table'

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
          group_nick_names = employees.map { |emp| nick_names[emp] }
          str << format_group("Group #{index + 1}", group_nick_names).to_s
          str << "\n\n"
        end

        str
      end

      private

      attr_reader :groups, :nick_names

      def format_group(name, members)
        Terminal::Table.new(headings: [name], rows: members.map { |m| [m] })
      end
    end
  end
end
