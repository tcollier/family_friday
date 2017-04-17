require_relative '../../../lib/family_friday/action/list_employees'

module FamilyFriday
  RSpec.describe Action::ListEmployees do
    subject { Action::ListEmployees.new(output: output) }

    let(:output) { instance_double(IO, puts: nil) }

    describe '#perform' do
      let(:employees) do
        [
          Employee.new(first_name: 'Bob', last_name: 'Barker'),
          Employee.new(first_name: 'Vanna', last_name: 'White')
        ]
      end

      before do
        allow(FamilyFriday.employee_store).to receive(:all)
          .and_return(employees)
      end

      it 'prints out each employee' do
        expect(output).to receive(:puts).with('Bob Barker (Bob)').ordered
        expect(output).to receive(:puts).with('Vanna White (Vanna)').ordered
        subject.perform(args: [])
      end

      context 'when there are no employees' do
        let(:employees) do
          []
        end

        it 'prints a useful message' do
          expect(output).to receive(:puts).with('<no employees>')
          subject.perform(args: [])
        end
      end
    end
  end
end
