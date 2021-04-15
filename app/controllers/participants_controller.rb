class ParticipantsController < ApplicationController

  include UsersHelper

  def new
    @team = current_team
    @event = Event.find_by_id(params[:event_id])
    @participant = @event.participants.build
  end

  def create
    @event = Event.find_by_id(params[:event_id])
    @participant = Participant.create!(participant_params)
    redirect_to event_path(params[:event_id])
  end

  def update
    @participant = Participant.find_by_id(params[:id])
    @participant.update!(participant_params)
  end

  def show
    @team = current_team
    @participant = Participant.find_by_id(params[:id])
    @event = Event.find_by_id(params[:event_id])
  end

  def edit
    @Participant = Participant.find_by_id(params[:id])
    @event = @participant.event
  end

  def destroy
    @team = current_team
    @participant = Participant.find_by_id(params[:id])
    @event = @participant.event
    @participant.destroy
    redirect_to event_path(@event.id)
  end

  def index
    @event = Event.find_by_id(params[:event_id])
    @participants = @event.participants
  end
end
