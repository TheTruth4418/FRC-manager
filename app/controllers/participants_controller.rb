class ParticipantsController < ApplicationController

  include UsersHelper
  before_action :admin_check, only: [:destroy]

  def new
    @team = current_team
    @event = Event.find_by_id(params[:event_id])
    @participant = Participant.new
  end

  def create
    @event = Event.find_by_id(params[:event_id])
    @participant = Participant.new(participant_params)
    if @participant.valid? && @event.id == params[:event_id].to_i
      @participant = Participant.create(participant_params)
      redirect_to event_participant_path(@event,@participant)
    else
      render "new"
    end
  end

  def update
    @participant = Participant.find_by_id(params[:id])
    @event = Event.find_by_id(params[:event_id])
    @participant.update!(participant_params)
    redirect_to event_participant_path(@event,@participant)
  end

  def show
    @user = current_user
    @team = current_team
    @participant = Participant.find_by_id(params[:id])
    @event = Event.find_by_id(params[:event_id])
  end

  def edit
    @participant = Participant.find_by_id(params[:id])
    @event = Event.find_by_id(params[:event_id])
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
