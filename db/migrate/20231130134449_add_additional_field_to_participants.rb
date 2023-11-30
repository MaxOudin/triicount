class AddAdditionalFieldToParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :additional_field, :string
  end
end
