require_relative '../../../lib/family_friday/cli/action'

module FamilyFriday::Cli
  RSpec.describe Action do
    class TestAction
    end

    describe '.commands' do
      it 'returns each configured action' do
        Action.configure do |config|
          config.add('foo', TestAction1)
          config.add('bar', TestAction2)
        end

        expect(Action.commands).to eq(%w[foo bar])
      end
    end

    describe '.lookup' do
      it 'looks up a configured action' do
        Action.configure do |config|
          config.add('foo', TestAction)
        end

        expect(subject.lookup('foo')).to eq(TestAction)
      end
    end

    describe '.each' do
      it 'iterates through each configured action' do
        iterated = {}

        Action.configure do |config|
          config.add('foo', TestAction1)
          config.add('bar', TestAction2)
        end

        Action.each do |key, value|
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
