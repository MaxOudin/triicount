class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :title
      t.string :description
      t.integer :amount_cents
      t.string :payer
      t.string :debtors
      t.references :tricount, null: false, foreign_key: true

      t.timestamps
    end
  end
end
