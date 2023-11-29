class ExpensesController < ApplicationController

  def index
    @expenses = Expense.all
  end

  def method_name
    
  end

end
