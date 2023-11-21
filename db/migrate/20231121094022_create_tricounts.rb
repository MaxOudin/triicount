class CreateTricounts < ActiveRecord::Migration[7.0]
  def change
    create_table :tricounts do |t|
      t.string :title
      t.string :description
      t.string :status
      t.string :participants
      t.references :user, null: false, foreign_key: true



      t.timestamps
    end
  end
end
