require_relative '../lib/family_friday'

FileUtils.rm_rf(File.join(File.dirname(__FILE__), '..', 'test.db'))

FamilyFriday.configure do |config|
  config.db_file = 'test.db'
end

require_relative '../db/create_employees.rb'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
