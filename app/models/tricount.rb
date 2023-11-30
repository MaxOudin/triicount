class Tricount < ApplicationRecord
  belongs_to :user
  has_many :expenses
  has_many :participants, dependent: :destroy

  accepts_nested_attributes_for :participants, allow_destroy: true
end
