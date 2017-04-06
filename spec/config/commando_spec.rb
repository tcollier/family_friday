RSpec.describe 'Commando action configuration' do
  before do
    # Reconfigure before each test in case another spec overwrote the config.
    require_relative '../../config/commando'
  end

  it 'configured "add"' do
    expect(Commando::Action.lookup('add'))
      .to eq(FamilyFriday::Action::AddEmployee)
  end

  it 'configured "groups"' do
    expect(Commando::Action.lookup('groups'))
      .to eq(FamilyFriday::Action::GroupEmployees)
  end

  it 'configured "help"' do
    expect(Commando::Action.lookup('help'))
      .to eq(Commando::Action::Help)
  end

  it 'configured "list"' do
    expect(Commando::Action.lookup('list'))
      .to eq(FamilyFriday::Action::ListEmployees)
  end

  it 'configured "quit"' do
    expect(Commando::Action.lookup('quit'))
      .to eq(Commando::Action::Quit)
  end

  it 'configured "size"' do
    expect(Commando::Action.lookup('size'))
      .to eq(FamilyFriday::Action::CountEmployees)
  end
end
