# Create the `employees` table that will store all application employees.

require 'sqlite3'

database = SQLite3::Database.new(FamilyFriday.config.db_file)
database.execute <<-SQL
  CREATE TABLE IF NOT EXISTS employees (
    first_name VARCHAR(64) NOT NULL,
    last_name  VARCHAR(64) NOT NULL,
    team       VARCHAR(64) NOT NULL
  );
SQL
