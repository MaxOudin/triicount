class Tricount < ApplicationRecord
  belongs_to :user
  has_one :participant
  has_many :expenses, dependent: :destroy

  accepts_nested_attributes_for :participant

  def calculate_balances
    balance_calculator.calculate_balances
  end

  private

  def balance_calculator
    @balance_calculator ||= BalanceCalculator.new(self)
  end

end
