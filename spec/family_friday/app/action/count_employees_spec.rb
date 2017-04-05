require_relative '../../../../lib/family_friday/app/action/count_employees'

module FamilyFriday::App
  RSpec.describe Action::CountEmployees do
    let(:output) { instance_double(IO, puts: nil) }

    describe '#perform' do
      before do
        expect(FamilyFriday.application.employee_store).to receive(:size)
          .and_return(31)
      end

      it 'prints the number of employees' do
        expect(output).to receive(:puts).with(31)
        Action::CountEmployees.perform(args: [], output: output)
      end
    end
  end
end
