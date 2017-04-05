require_relative '../../../../lib/family_friday/cli/action/quit'

module FamilyFriday::Cli
  RSpec.describe Action::Quit do
    subject { Action::Quit.new(args: []) }

    describe '#perform' do
      it 'raises a QuitException' do
        expect do
          subject.perform
        end.to raise_error(QuitException)
      end
    end
  end
end
