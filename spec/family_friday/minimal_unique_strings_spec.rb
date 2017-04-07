require_relative '../../lib/family_friday/minimal_unique_strings'

module FamilyFriday
  RSpec.describe MinimalUniqueStrings do
    describe '#map' do
      context 'with 1 string' do
        let(:strings) { %w[foo] }

        it 'maps the string to the first letter' do
          map = MinimalUniqueStrings.map(strings)
          expect(map.length).to eq(1)
          expect(map['foo']).to eq('f')
        end
      end

      context 'with 2 strings starting with different letters' do
        let(:strings) { %w[foo goo] }

        it 'maps the strings to their first letters' do
          map = MinimalUniqueStrings.map(strings)
          expect(map.length).to eq(2)
          expect(map['foo']).to eq('f')
          expect(map['goo']).to eq('g')
        end
      end

      context 'with 2 strings starting with the same letter' do
        let(:strings) { %w[foo faa] }

        it 'maps the strings to their first 2 letters' do
          map = MinimalUniqueStrings.map(strings)
          expect(map.length).to eq(2)
          expect(map['foo']).to eq('fo')
          expect(map['faa']).to eq('fa')
        end
      end

      context 'with 2 similar strings' do
        let(:strings) { %w[foo foo] }

        it 'maps the string to itself' do
          map = MinimalUniqueStrings.map(strings)
          expect(map.length).to eq(1)
          expect(map['foo']).to eq('foo')
        end
      end
    end
  end
end
