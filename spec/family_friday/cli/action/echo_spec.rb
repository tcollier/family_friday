require_relative '../../../../lib/family_friday/cli/action/echo'

module FamilyFriday::Cli
  RSpec.describe Action::Echo do
    subject do
      Action::Echo.new(args: ['Foo', 'Bar'], output: output)
    end

    let(:output) { instance_double(IO) }

    describe '#perform' do
      it 'puts the arguments to the output stream' do
        expect(output).to receive(:puts).with('Foo Bar')
        subject.perform
      end
    end
  end
end
