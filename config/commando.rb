require_relative '../lib/family_friday/action/add_employee'
require_relative '../lib/family_friday/action/count_employees'
require_relative '../lib/family_friday/action/group_employees'
require_relative '../lib/family_friday/action/list_employees'

Commando.configure do |config|
  config.greeting =
    'Welcome the the Family Friday app! Type "help" to list commands'

  config.prompt = 'family-friday> '

  config.register 'add',
                  FamilyFriday::Action::AddEmployee,
                  'Adds a new employee (args: first_name, last_name)'

  config.register 'groups',
                  FamilyFriday::Action::GroupEmployees,
                  'Group all employees into randomized groups'

  config.register 'list',
                  FamilyFriday::Action::ListEmployees,
                  'List all employees'

  config.register 'size',
                  FamilyFriday::Action::CountEmployees,
                  'Count the number of employees'
end
