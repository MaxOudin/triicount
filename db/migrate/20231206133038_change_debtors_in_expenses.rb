class ChangeDebtorsInExpenses < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      ALTER TABLE expenses
      ALTER COLUMN debtors TYPE character varying[] USING debtors::character varying[];
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE expenses
      ALTER COLUMN debtors TYPE character varying[] USING debtors::character varying[];
    SQL
  end
end
