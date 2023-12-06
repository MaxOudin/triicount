class Tricount < ApplicationRecord
  belongs_to :user
  has_one :participant
  has_many :expenses, dependent: :destroy
  
  accepts_nested_attributes_for :participant
end
