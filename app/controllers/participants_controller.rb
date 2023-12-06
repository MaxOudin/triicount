class ParticipantsController < ApplicationController

  def new
    @participant = Participant.new
  end

  def create
    @tricount = Tricount.find(params[:tricount_id])
    @participant = Participant.new(participant_params)
    @participant.tricount = @tricount
    @participant.save
  end

  private

  def participant_params
    params.require(:participant).permit(:names)
  end

end
