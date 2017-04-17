require_relative '../../../lib/family_friday/action/count_employees'

module FamilyFriday
  RSpec.describe Action::CountEmployees do
    subject { Action::CountEmployees.new(output: output) }

    let(:output) { instance_double(IO, puts: nil) }

    describe '#perform' do
      before do
        expect(FamilyFriday.employee_store).to receive(:size)
          .and_return(31)
      end

      it 'prints the number of employees' do
        expect(output).to receive(:puts).with(31)
        subject.perform(args: [])
      end
    end
  end
end
