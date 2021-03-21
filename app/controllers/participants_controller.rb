class ParticipantsController < ApplicationController
  def new
    @team = current_team
    @event = Event.find_by_id(params[:event_id])
    @opponent = @event.opponents.build
  end

  def create
    @event = Event.find_by_id(params[:event_id])
    @participant = Participant.create!(participant_params)
  end

  def update
    @participant = Participant.find_by_id(params[:id])
    @participant.update!(participant_params)
  end

  def show
    @team = current_team
    @opponent = Opponent.find_by_id(params[:id])
    @event = Event.find_by_id(params[:event_id])
  end

  def edit
    @opponent = Opponent.find_by_id(params[:id])
    @event = @opponent.event
  end

  def destroy
    @team = current_team
    @event = Event.find_by_id(params[:event_id])
    @opponent = Opponent.find_by_id(params[:id])
    @opponent.destroy
  end

  def index
    @event = Evnet.find_by_id(params[:event_id])
    @participants = @event.participants
  end
end
