require 'sqlite3'

require_relative '../../../lib/family_friday/app/employee'
require_relative '../../../lib/family_friday/app/employee_store'

module FamilyFriday::App
  RSpec.describe EmployeeStore do
    subject { EmployeeStore.new(database: database) }

    let(:database) { SQLite3::Database.new(FamilyFriday.config.db_file) }

    after { database.execute('DELETE FROM employees') }

    describe '#add' do
      it 'adds a record to the DB' do
        employee = Employee.new(first_name: 'Fred', last_name: 'Flintsone')
        subject.add(employee)
        results = database.execute('SELECT first_name, last_name FROM employees')
        expect(results.length).to eq(1)
        expect(results[0]).to eq(['Fred', 'Flintsone'])
      end
    end

    describe '#all' do
      before do
        database.execute('INSERT INTO employees VALUES (?, ?)', 'Vanna', 'White')
        database.execute('INSERT INTO employees VALUES (?, ?)', 'Bob', 'Barker')
      end

      it 'returns all employee sorted by first name' do
        all = subject.all
        expect(all.length).to eq(2)
        expect(all[0]).to be_a(Employee)
        expect(all[0].first_name).to eq('Bob')
        expect(all[0].last_name).to eq('Barker')
        expect(all[1]).to be_a(Employee)
        expect(all[1].first_name).to eq('Vanna')
        expect(all[1].last_name).to eq('White')
      end
    end

    describe '#size' do
      before do
        database.execute('INSERT INTO employees VALUES (?, ?)', 'Bob', 'Barker')
        database.execute('INSERT INTO employees VALUES (?, ?)', 'Vanna', 'White')
      end

      it 'returns the count of employee in the DB' do
        expect(subject.size).to eq(2)
      end
    end
  end
end
