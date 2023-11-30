class TricountsController < ApplicationController
  before_action :find_user_id
  before_action :authenticate_user!

  def index
    @tricounts = Tricount.all
  end

  def new
    @tricount = Tricount.new
    @tricount.participants.build
  end

  def create
    @tricount = Tricount.new(tricount_params)
    @tricount.user = @user
    if @tricount.save
      redirect_to user_tricounts_path(@user), notice: 'Triicount was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tricount = Tricount.find(params[:id])
  end

  private

  def find_user_id
    @user = User.find(params[:user_id])
  end

  def tricount_params
    params.require(:tricount).permit(:title, :description, :status, :user_id,
      participants_attributes: [:id, :_destroy, :other_attributes])
  end
end
