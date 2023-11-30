class ChangeNameInParticipants < ActiveRecord::Migration[7.0]
  def change
    remove_column :participants, :name
    add_column :participants, :names, :string, array: true, default: []
  end
end
