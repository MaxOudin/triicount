class ExpensesController < ApplicationController
  before_action :find_tricount_id

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
    @participant = Participant.find_by(tricount_id: @tricount.id)
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.tricount_id = @tricount.id
    if @expense.save
      redirect_to user_tricount_path(@tricount.user, @tricount), notice: 'Expense was successfully created.'
    else
      flash[:alert] = 'Expense could not be created'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_tricount_id
    @tricount = Tricount.find_by(id: params[:tricount_id])
  end

  def expense_params
    params.require(:expense).permit(:user_id, :tricount_id, :title, :description, :amount_cents, :payer, debtors: [])
  end

end
