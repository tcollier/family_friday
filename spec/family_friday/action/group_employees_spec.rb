require_relative '../../../lib/family_friday/action/group_employees'

module FamilyFriday
  RSpec.describe Action::GroupEmployees do
    let(:output) { instance_double(IO, puts: nil) }

    describe '#perform' do
      before do
        allow(FamilyFriday.application.employee_store).to receive(:all)
          .and_return(employees)
      end

      context 'when there are no employees' do
        let(:employees) { [] }

        it 'prints a useful message' do
          expect(output).to receive(:puts).with('<no employees>')
          Action::GroupEmployees.perform(args: [], output: output)
        end
      end

      context 'when there is at least 1 employee' do
        let(:employees) { [double('employees')] }

        before do
          groups = double('groups')
          allow(Grouper).to receive(:new).with(items: employees)
            .and_return(instance_double(Grouper, groups: groups))

          nick_names = double('nick names')
          allow(NickNameMap).to receive(:new).with(employees: employees)
            .and_return(nick_names)

          allow(Formatter::Groups).to receive(:new)
            .with(groups: groups, nick_names: nick_names)
            .and_return(instance_double(Formatter::Groups, to_s: 'groups output'))
        end

        it 'prints a formatted string' do
          expect(output).to receive(:puts).with('groups output')
          Action::GroupEmployees.perform(args: [], output: output)
        end
      end
    end
  end
end