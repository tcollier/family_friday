require 'readline'

require_relative '../lib/commando/action'
require_relative '../lib/commando/action/help'
require_relative '../lib/commando/action/history'
require_relative '../lib/commando/action/quit'

require_relative '../lib/family_friday/app/action/add_employee'
require_relative '../lib/family_friday/app/action/count_employees'
require_relative '../lib/family_friday/app/action/group_employees'
require_relative '../lib/family_friday/app/action/list_employees'

Commando::Action.configure do |config|
  config.add 'add',
             FamilyFriday::App::Action::AddEmployee,
             'Adds a new employee (args: first_name, last_name)'

  config.add 'groups',
             FamilyFriday::App::Action::GroupEmployees,
             'Group all employees into randomized groups'

  config.add 'help',
             Commando::Action::Help,
             'Print this message'

  config.add 'history',
             Commando::Action::History,
             'Print the history of commands'

  config.add 'list',
             FamilyFriday::App::Action::ListEmployees,
             'List all employees'

  config.add 'quit',
             Commando::Action::Quit,
             'Exit the program'

  config.add 'size',
             FamilyFriday::App::Action::CountEmployees,
             'Count the number of employees'
end

# Configure readline
comp = proc { |s| Commando::Action.commands.grep(/^#{Regexp.escape(s)}/) }

Readline.completion_append_character = " "
Readline.completion_proc = comp
