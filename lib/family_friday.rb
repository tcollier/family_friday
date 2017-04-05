require_relative 'family_friday/application'

module FamilyFriday
  Config = Struct.new(:db_file)

  def self.configure(&block)
    yield config
  end

  def self.application
    @application ||= Application.new(config: config)
  end

  def self.config
    @config ||= Config.new
  end
end
