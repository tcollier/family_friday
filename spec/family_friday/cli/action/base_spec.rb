module FamilyFriday::Cli
  RSpec.describe Action::Base do
    class Action1 < Action::Base
    end

    class Action2 < Action::Base
    end

    describe '#==' do
      context 'when the other action is a different class' do
        it 'is not equal' do
          expect(Action1.new(args: [])).to_not eq(Action2.new(args: []))
        end
      end

      context 'when the other action has different args' do
        it 'is not equal' do
          expect(Action1.new(args: ['foo']))
            .to_not eq(Action1.new(args: ['bar']))
        end
      end

      context 'when the other action has the same args' do
        it 'is equal' do
          expect(Action1.new(args: ['foo']))
            .to eq(Action1.new(args: ['foo']))
        end
      end
    end
  end
end
