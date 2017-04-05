require_relative '../lib/family_friday/cli/action'
require_relative '../lib/family_friday/cli/action/echo'
require_relative '../lib/family_friday/cli/action/help'
require_relative '../lib/family_friday/cli/action/quit'

FamilyFriday::Cli::Action.configure do |config|
  config.add('echo', FamilyFriday::Cli::Action::Echo)
  config.add('help', FamilyFriday::Cli::Action::Help)
  config.add('quit', FamilyFriday::Cli::Action::Quit)
end
