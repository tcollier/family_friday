require_relative '../../lib/family_friday/employee'
require_relative '../../lib/family_friday/nick_name_map'

module FamilyFriday
  RSpec.describe NickNameMap do
    describe '#[]' do
      subject { NickNameMap.new(employees: employees) }

      context 'with 1 employee' do
        let(:employee) do
          instance_double(
            Employee,
            first_name: 'Tom',
            last_name: 'Collins'
          )
        end
        let(:employees) { [employee] }

        it 'maps the employee to the first name' do
          expect(subject[employee]).to eq('Tom')
        end
      end

      context 'with 2 employees having different first names' do
        let(:employee_1) do
          instance_double(
            Employee,
            first_name: 'Tom',
            last_name: 'Collins'
          )
        end
        let(:employee_2) do
          instance_double(
            Employee,
            first_name: 'Shirley',
            last_name: 'Temple'
          )
        end
        let(:employees) { [employee_1, employee_2] }

        it 'maps the employees to their first names' do
          expect(subject[employee_1]).to eq('Tom')
          expect(subject[employee_2]).to eq('Shirley')
        end
      end

      context 'with 2 employees having the same first name' do
        let(:employee_1) do
          instance_double(
            Employee,
            first_name: 'Shirley',
            last_name: 'Collins'
          )
        end
        let(:employee_2) do
          instance_double(
            Employee,
            first_name: 'Shirley',
            last_name: 'Temple'
          )
        end
        let(:employees) { [employee_1, employee_2] }

        it 'maps the employees to their first name and abbreviated last name' do
          expect(subject[employee_1]).to eq('Shirley C.')
          expect(subject[employee_2]).to eq('Shirley T.')
        end
      end
    end
  end
end
