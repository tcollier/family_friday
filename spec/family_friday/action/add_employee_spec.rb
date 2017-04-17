require_relative '../../../lib/family_friday/employee_store'
require_relative '../../../lib/family_friday/action/add_employee'

module FamilyFriday
  RSpec.describe Action::AddEmployee do
    subject do
      Action::AddEmployee.new(employee_store: employee_store, output: output)
    end

    let(:employee_store) { instance_double(EmployeeStore, add: nil) }
    let(:output) { instance_double(IO, puts: nil) }

    describe '#perform' do
      let(:args) { %w[Bob Barker] }

      it 'adds the employee to the data store' do
        expected_employee = Employee.new(
          first_name: 'Bob',
          last_name: 'Barker'
        )
        expect(employee_store).to receive(:add).with(expected_employee)
        subject.perform(args: args)
      end

      it 'prints a success message' do
        expect(output).to receive(:puts).with('Added employee Bob Barker')
        subject.perform(args: args)
      end

      context 'when there are the wrong number of arguments' do
        let(:args) { Array.new([0, 1, 3, 4].sample) { 'Foo' } }

        it 'raises an ArguemntError' do
          message = 'You must supply a first and last name'
          expect do
            subject.perform(args: args)
          end.to raise_error(ArgumentError, message)
        end
      end
    end
  end
end
