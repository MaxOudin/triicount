class TricountController < ApplicationController
  before_action :find_user_id
  before_action :authenticate_user!

  def new
    @tricount = Tricount.new
  end

  def create
    @tricount = Tricount.new(tricount_params)
    @tricount.user = @user
    if @tricount.save
      redirect_to tricounts_path(@user), notice: 'Triicount was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_user_id
    @user = User.find(params[:user_id])
  end

  def tricount_params
    params.require(:tricount).permit(:user, :title, :description, :participants, :user_id)
  end
end
