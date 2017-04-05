require_relative '../../../lib/family_friday/cli/interpreter'

module FamilyFriday::Cli
  RSpec.describe Interpreter do
    subject { Interpreter.new(input: 'foo bar baz', output: output) }

    let(:output) { instance_double(IO) }

    before do
      allow(ActionFactory).to receive(:make)
        .with('foo', %w[bar baz], output: output)
        .and_return(action)
    end

    describe '#interpret' do
      describe 'when no action is configured for the command' do
        let(:action) { nil }

        it 'prints a useful message' do
          message =
            'Unrecognized command: foo. Type "help" for a list of valid commands'
          expect(output).to receive(:puts).with(message)
          subject.interpret
        end
      end

      describe 'when an action is configured for the command' do
        let(:action) { instance_double(Action::Base) }

        it 'prints a useful message' do
          expect(action).to receive(:perform)
          subject.interpret
        end
      end
    end
  end
end
