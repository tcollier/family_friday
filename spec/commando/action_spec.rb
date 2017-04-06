require_relative '../../lib/commando/action'

module Commando
  RSpec.describe Action do
    class TestAction1
    end

    class TestAction2
    end

    describe '.commands' do
      it 'returns each configured action' do
        Action.configure do |config|
          config.add('foo', TestAction1, 'test action 1')
          config.add('bar', TestAction2, 'test action 2')
        end

        expect(Action.commands).to eq(%w[foo bar])
      end
    end

    describe '.lookup' do
      it 'looks up a configured action' do
        Action.configure do |config|
          config.add('foo', TestAction1, 'test action 1')
        end

        expect(subject.lookup('foo')).to eq(TestAction1)
      end
    end

    describe '.each_description' do
      it 'iterates through each configured action' do
        iterated = {}

        Action.configure do |config|
          config.add('foo', TestAction1, 'test action 1')
          config.add('bar', TestAction2, 'test action 2')
        end

        Action.each_description do |key, value|
          iterated[key] = value
        end
        expect(iterated.size).to eq(2)
        expect(iterated).to have_key('foo')
        expect(iterated['foo']).to eq('test action 1')
        expect(iterated).to have_key('bar')
        expect(iterated['bar']).to eq('test action 2')
      end
    end
  end
end
