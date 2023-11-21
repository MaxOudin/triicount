class TricountController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @tricount = Tricount.new
  end

  def create

  end
end
