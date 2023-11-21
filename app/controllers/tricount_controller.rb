class TricountController < ApplicationController

  def new
    @tricount = Tricount.new
  end

  def create
    @tricount = Tricount.new(tricount_params)
    if @tricount.save
      redirect_to @tricount, notice: 'Triicount was successfully created.'
    else
      render :new
    end
  end

  private

  def tricount_params
    params.require(:tricount).permit(:title, :description, :participants)
  end
end
