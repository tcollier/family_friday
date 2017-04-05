require_relative '../../../lib/family_friday/cli/action_factory'

module FamilyFriday::Cli
  RSpec.describe ActionFactory do
    class TestAction < Action::Base
    end

    describe '.make' do
      before do
        allow(Action).to receive(:lookup).with('foo')
          .and_return(lookup_class)
      end

      context 'when an action is configured for the command' do
        let(:lookup_class) { TestAction }

        it 'returns nil' do
          expect(subject.make('foo', %w[bar baz]))
            .to eq(TestAction.new(args: %w[bar baz]))
        end
      end

      context 'when an action is not configured for the command' do
        let(:lookup_class) { nil }

        it 'returns nil' do
          expect(subject.make('foo', %w[bar baz])).to be_nil
        end
      end
    end
  end
end
