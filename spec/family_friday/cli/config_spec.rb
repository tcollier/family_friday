require_relative '../../../lib/family_friday/cli/config'

module FamilyFriday::Cli
  RSpec.describe Config do
    class TestAction1
    end

    class TestAction2
    end

    describe '.lookup' do
      it 'looks up a configured action' do
        subject.add('foo', TestAction1)
        expect(subject.lookup('foo')).to eq(TestAction1)
      end

      context 'when 2 actions are configured' do
        it 'looks up the correct action' do
          subject.add('foo', TestAction1)
          subject.add('bar', TestAction2)
          expect(subject.lookup('foo')).to eq(TestAction1)
        end
      end

      context 'when the action is not configured' do
        it 'returns nil' do
          subject.add('foo', TestAction1)
          expect(subject.lookup('bar')).to be_nil
        end
      end
    end

    describe '.each' do
      it 'iterates through each action' do
        iterated = {}
        subject.add('foo', TestAction1)
        subject.add('bar', TestAction2)
        subject.each do |key, value|
          iterated[key] = value
        end
        expect(iterated.size).to eq(2)
        expect(iterated).to have_key('foo')
        expect(iterated['foo']).to eq(TestAction1)
        expect(iterated).to have_key('bar')
        expect(iterated['bar']).to eq(TestAction2)
      end
    end
  end
end
