class RenameTricountsIdInParticipants < ActiveRecord::Migration[7.0]
  def change
    rename_column :participants, :tricounts_id, :tricount_id
  end
end
