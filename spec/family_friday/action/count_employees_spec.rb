require_relative '../../../lib/family_friday/employee_store'
require_relative '../../../lib/family_friday/action/count_employees'

module FamilyFriday
  RSpec.describe Action::CountEmployees do
    subject do
      Action::CountEmployees.new(employee_store: employee_store, output: output)
    end

    let(:employee_store) { instance_double(EmployeeStore, size: 31) }
    let(:output) { instance_double(IO, puts: nil) }

    describe '#perform' do
      it 'prints the number of employees' do
        expect(output).to receive(:puts).with(31)
        subject.perform(args: [])
      end
    end
  end
end
