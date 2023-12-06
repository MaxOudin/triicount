class TricountsController < ApplicationController
  before_action :find_user_id
  before_action :authenticate_user!

  def index
    @tricounts = Tricount.all
  end

  def new
    @tricount = Tricount.new
    # Build an empty participant to be rendered in the form
    @participant = Participant.new
  end

  def create
    @tricount = Tricount.new(tricount_params)
    @tricount.user = @user

    # Note: Check if participants_attributes is present in tricount_params
    if tricount_params[:participant_attributes].present?
      # Create participants from the nested attributes
      Participant.create(tricount_params[:participant_attributes]['0'])
    end

    if @tricount.save
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
    params.require(:tricount).permit(:title, :description, :status, :user_id, participant_attributes: [:names])
  end

end
