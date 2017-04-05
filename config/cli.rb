require 'readline'

require_relative '../lib/family_friday/cli/action'
require_relative '../lib/family_friday/cli/action/add_employee'
require_relative '../lib/family_friday/cli/action/count_employees'
require_relative '../lib/family_friday/cli/action/group_employees'
require_relative '../lib/family_friday/cli/action/help'
require_relative '../lib/family_friday/cli/action/history'
require_relative '../lib/family_friday/cli/action/list_employees'
require_relative '../lib/family_friday/cli/action/quit'

FamilyFriday::Cli::Action.configure do |config|
  config.add('add', FamilyFriday::Cli::Action::AddEmployee)
  config.add('groups', FamilyFriday::Cli::Action::GroupEmployees)
  config.add('help', FamilyFriday::Cli::Action::Help)
  config.add('history', FamilyFriday::Cli::Action::History)
  config.add('list', FamilyFriday::Cli::Action::ListEmployees)
  config.add('quit', FamilyFriday::Cli::Action::Quit)
  config.add('size', FamilyFriday::Cli::Action::CountEmployees)
end

comp = proc { |s| FamilyFriday::Cli::Action.commands.grep(/^#{Regexp.escape(s)}/) }

Readline.completion_append_character = " "
Readline.completion_proc = comp
