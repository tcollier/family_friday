RSpec.describe 'CLI action configuration' do
  before do
    # Reconfigure before each test in case another spec overwrote the config.
    require_relative '../../config/cli'
  end

  it 'configured "add"' do
    expect(FamilyFriday::Cli::Action.lookup('add'))
      .to eq(FamilyFriday::App::Action::AddEmployee)
  end

  it 'configured "groups"' do
    expect(FamilyFriday::Cli::Action.lookup('groups'))
      .to eq(FamilyFriday::App::Action::GroupEmployees)
  end

  it 'configured "help"' do
    expect(FamilyFriday::Cli::Action.lookup('help'))
      .to eq(FamilyFriday::Cli::Action::Help)
  end

  it 'configured "list"' do
    expect(FamilyFriday::Cli::Action.lookup('list'))
      .to eq(FamilyFriday::App::Action::ListEmployees)
  end

  it 'configured "quit"' do
    expect(FamilyFriday::Cli::Action.lookup('quit'))
      .to eq(FamilyFriday::Cli::Action::Quit)
  end

  it 'configured "size"' do
    expect(FamilyFriday::Cli::Action.lookup('size'))
      .to eq(FamilyFriday::App::Action::CountEmployees)
  end
end
