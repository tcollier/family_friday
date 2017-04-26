require_relative '../../lib/family_friday/employee'

module FamilyFriday
  RSpec.describe Employee do
    describe '#==' do
      context 'when the other object is a different class' do
        it 'is not equal' do
          expect(Employee.new(first_name: 'Fred', last_name: 'Flintsone', team: 'caveman'))
            .to_not eq(Object.new)
        end
      end

      context 'when the other Employee has a different first name' do
        it 'is not equal' do
          expect(Employee.new(first_name: 'Fred', last_name: 'Flintsone', team: 'caveman'))
            .to_not eq(Employee.new(first_name: 'Fred', last_name: 'Savage', team: 'caveman'))
        end
      end

      context 'when the other Employee has a different last name' do
        it 'is not equal' do
          expect(Employee.new(first_name: 'Fred', last_name: 'Flintsone', team: 'caveman'))
            .to_not eq(Employee.new(first_name: 'Wilma', last_name: 'Flintsone', team: 'caveman'))
        end
      end

      context 'when the other Employee is on a different team' do
        it 'is not equal' do
          expect(Employee.new(first_name: 'Fred', last_name: 'Flintsone', team: 'caveman'))
            .to_not eq(Employee.new(first_name: 'Fred', last_name: 'Flintsone', team: 'neanderthal'))
        end
      end

      context 'when the other Employee has the same names' do
        it 'is equal' do
          expect(Employee.new(first_name: 'Fred', last_name: 'Flintsone', team: 'caveman'))
            .to eq(Employee.new(first_name: 'Fred', last_name: 'Flintsone', team: 'caveman'))
        end
      end
    end
  end
end
