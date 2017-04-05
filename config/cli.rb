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
  config.add 'add',
             FamilyFriday::Cli::Action::AddEmployee,
             'Adds a new employee (args: first_name, last_name)'

  config.add 'groups',
             FamilyFriday::Cli::Action::GroupEmployees,
             'Group all employees into randomized groups'
             
  config.add 'help',
             FamilyFriday::Cli::Action::Help,
             'Print this message'

  config.add 'history',
             FamilyFriday::Cli::Action::History,
             'Print the history of commands'

  config.add 'list',
             FamilyFriday::Cli::Action::ListEmployees,
             'List all employees'

  config.add 'quit',
             FamilyFriday::Cli::Action::Quit,
             'Exit the program'

  config.add 'size',
             FamilyFriday::Cli::Action::CountEmployees,
             'Count the number of employees'
end

comp = proc { |s| FamilyFriday::Cli::Action.commands.grep(/^#{Regexp.escape(s)}/) }

Readline.completion_append_character = " "
Readline.completion_proc = comp
