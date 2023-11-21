class Tricount < ApplicationRecord
  belongs_to :user
  has_many :expenses
  has_many :participants, dependent: :destroy
end
