require_relative '../../../../lib/family_friday/cli/action'
require_relative '../../../../lib/family_friday/cli/action/help'

module FamilyFriday::Cli
  RSpec.describe Action::Help do
    class TestAction1
      def self.description
        'Test action 1'
      end
    end

    class TestAction2
      def self.description
        'Test action 2'
      end
    end

    subject do
      Action::Help.new(args: [], output: output)
    end

    let(:output) { instance_double(IO) }

    describe '#perform' do
      before do
        FamilyFriday::Cli::Action.configure do |config|
          config.add('test1', TestAction1, 'test action 1')
          config.add('test2', TestAction2, 'test action 2')
        end

        allow(output).to receive(:puts)
      end

      it 'puts a list of commands to the output stream' do
        expect(output).to receive(:puts)
          .with(/test1 - test action 1/)
        expect(output).to receive(:puts)
          .with(/test2 - test action 2/)
        subject.perform
      end
    end
  end
end
