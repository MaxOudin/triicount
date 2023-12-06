class Participant < ApplicationRecord
  belongs_to :tricount

  def names_array
    self.names.split(',')
  end
end
