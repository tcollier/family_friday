require 'sqlite3'

require_relative 'app/employee_store'

module FamilyFriday
  class Application
    def initialize(config:)
      @config = config
    end

    def employee_store
      @employee_store ||= App::EmployeeStore.new(database: database)
    end

    private

    attr_reader :config

    def database
      @database ||= SQLite3::Database.new(config.db_file)
    end
  end
end