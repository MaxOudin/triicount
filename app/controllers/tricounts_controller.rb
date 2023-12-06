class TricountsController < ApplicationController
  before_action :find_user_id
  before_action :authenticate_user!

  def index
    @tricounts = Tricount.all
  end

  def new
    @tricount = Tricount.new
    @participant = Participant.new(tricount: @tricount, names:[""])
  end

  def create
    @tricount = Tricount.new(tricount_params)
    @participant = Participant.new
    @tricount.user = @user

    if @tricount.save
      @participant.tricount = @tricount
      params[:tricount][:participant_attributes][:names].split(", ").each do |name|
        @participant.names << name
      end
      @participant.save
      redirect_to user_tricounts_path(@user), notice: 'Triicount was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tricount = Tricount.find(params[:id])
    @participants = Participant.where(tricount_id: @tricount.id)
  end

  private

  def find_user_id
    @user = User.find(params[:user_id])
  end

  def tricount_params
    params.require(:tricount).permit(:title, :description, :status, participants_attributes: [:names])
  end

end
