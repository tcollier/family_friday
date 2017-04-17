require 'sqlite3'

require_relative 'family_friday/employee_store'

module FamilyFriday
  Config = Struct.new(:db_file)

  def self.configure(&block)
    yield config
  end

  def self.config
    @config ||= Config.new
  end
end
