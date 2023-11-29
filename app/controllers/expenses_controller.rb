class ExpensesController < ApplicationController
  before_action :find_tricount_id

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new
  end

  private

  def find_tricount_id
    @tricount = Tricount.find(params[:tricount_id])
  end

  def expense_params
    params.require(:expense).permit(:tricount, :title, :description, :amount_cents, :payer, :debtors)
  end

end
