require_relative '../../../../lib/family_friday/cli/action/list_employees'

module FamilyFriday::Cli
  RSpec.describe Action::ListEmployees do
    subject do
      Action::ListEmployees.new(args: [], output: output)
    end

    let(:output) { instance_double(IO, puts: nil) }

    describe '#perform' do
      let(:employees) do
        [
          FamilyFriday::App::Employee.new(first_name: 'Bob', last_name: 'Barker'),
          FamilyFriday::App::Employee.new(first_name: 'Vanna', last_name: 'White')
        ]
      end

      before do
        expect(FamilyFriday.application.employee_store).to receive(:all)
          .and_return(employees)
      end

      it 'prints out each employee' do
        expect(output).to receive(:puts).with('Bob Barker').ordered
        expect(output).to receive(:puts).with('Vanna White').ordered
        subject.perform
      end

      context 'when there are no employees' do
        let(:employees) do
          []
        end

        it 'prints a useful message' do
          expect(output).to receive(:puts).with('<no employees>')
          subject.perform
        end
      end
    end
  end
end