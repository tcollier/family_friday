require_relative '../../../lib/family_friday/action/add_employee'

module FamilyFriday
  RSpec.describe Action::AddEmployee do
    let(:output) { instance_double(IO, puts: nil) }

    describe '#perform' do
      let(:args) { %w[Bob Barker] }

      before do
        allow(FamilyFriday.application.employee_store).to receive(:add)
      end

      it 'adds the employee to the data store' do
        expected_employee = Employee.new(
          first_name: 'Bob',
          last_name: 'Barker'
        )
        expect(FamilyFriday.application.employee_store).to receive(:add)
          .with(expected_employee)
        Action::AddEmployee.perform(args: args, output: output)
      end

      it 'prints a success message' do
        expect(output).to receive(:puts).with('Added employee Bob Barker')
        Action::AddEmployee.perform(args: args, output: output)
      end

      context 'when there are the wrong number of arguments' do
        let(:args) { Array.new([0, 1, 3, 4].sample) { 'Foo' } }

        it 'raises a ValidationError' do
          message = 'You must supply a first and last name'
          expect do
            Action::AddEmployee.perform(args: args, output: output)
          end.to raise_error(Commando::ValidationError, message)
        end
      end
    end
  end
end
