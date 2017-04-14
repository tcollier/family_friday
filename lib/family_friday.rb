require 'sqlite3'

require_relative 'family_friday/employee_store'

module FamilyFriday
  Config = Struct.new(:db_file)

  def self.configure(&block)
    yield config
  end

  def self.employee_store
    raise 'You must configure the db_file' if config.db_file.nil?
    @employee_store ||=
      EmployeeStore.new(database: SQLite3::Database.new(config.db_file))
  end

  def self.config
    @config ||= Config.new
  end
end
