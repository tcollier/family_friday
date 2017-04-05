require_relative '../../../../lib/family_friday/cli/action/quit'

module FamilyFriday::Cli
  RSpec.describe Action::Quit do
    describe '#perform' do
      it 'raises a QuitException' do
        expect do
          Action::Quit.perform(args: [])
        end.to raise_error(QuitException)
      end
    end
  end
end
