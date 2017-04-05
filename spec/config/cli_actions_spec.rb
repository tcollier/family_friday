RSpec.describe 'CLI action configuration' do
  before do
    # Reconfigure before each test in case another spec overwrote the config.
    require_relative '../../config/cli_actions'
  end

  it 'configured "help"' do
    expect(FamilyFriday::Cli::Action.lookup('help'))
      .to eq(FamilyFriday::Cli::Action::Help)
  end

  it 'configured "echo"' do
    expect(FamilyFriday::Cli::Action.lookup('echo'))
      .to eq(FamilyFriday::Cli::Action::Echo)
  end

  it 'configured "quit"' do
    expect(FamilyFriday::Cli::Action.lookup('quit'))
      .to eq(FamilyFriday::Cli::Action::Quit)
  end
end