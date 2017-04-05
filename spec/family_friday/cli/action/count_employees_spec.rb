require_relative '../../../../lib/family_friday/cli/action/count_employees'

module FamilyFriday::Cli
  RSpec.describe Action::CountEmployees do
    subject do
      Action::CountEmployees.new(args: [], output: output)
    end

    let(:output) { instance_double(IO, puts: nil) }

    describe '#perform' do
      before do
        expect(FamilyFriday.application.employee_store).to receive(:size)
          .and_return(31)
      end

      it 'prints the number of employees' do
        expect(output).to receive(:puts).with(31)
        subject.perform
      end
    end
  end
end
