class ExpensesController < ApplicationController
  before_action :find_tricount_id

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.tricount_id = @tricount.id
    if @expense.save
      redirect_to user_tricounts_path(@tricount), notice: 'Expense was successfully created.'
    else
      flash[:alert] = 'Expense could not be created'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_tricount_id
    @tricount = Tricount.find_by(id: params[:tricount_id])
    @user = @tricount.user

    unless @tricount
      flash[:alert] = 'Tricount not found'
      redirect_to root_path
    end
  end

  def expense_params
    params.require(:expense).permit(:user_id, :tricount_id, :title, :description)
  end

end
