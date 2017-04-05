require_relative '../lib/family_friday/cli/action'
require_relative '../lib/family_friday/cli/action/add_employee'
require_relative '../lib/family_friday/cli/action/count_employees'
require_relative '../lib/family_friday/cli/action/help'
require_relative '../lib/family_friday/cli/action/list_employees'
require_relative '../lib/family_friday/cli/action/quit'

FamilyFriday::Cli::Action.configure do |config|
  config.add('add', FamilyFriday::Cli::Action::AddEmployee)
  config.add('help', FamilyFriday::Cli::Action::Help)
  config.add('list', FamilyFriday::Cli::Action::ListEmployees)
  config.add('quit', FamilyFriday::Cli::Action::Quit)
  config.add('size', FamilyFriday::Cli::Action::CountEmployees)
end
