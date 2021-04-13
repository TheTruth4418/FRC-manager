class ScoutsController < ApplicationController

  include UsersHelper

  def new
    @team = current_team
    @participant = Participant.find_by(params[:participant_id])
    @event = Event.find_by(params[:event_id])
  end

  def create
    @team = current_team
    @event = Event.find_by(params[:event_id])
    @participant = Participant.find_by(params[:participant_id])
    @scout = Scout.create!(scout_params)
    render :controller => 'participants', :action => 'show', :id => @participant.id
  end

  def update
    @team = current_team
    @event = Event.find_by_id(paramsa[event_id])
    @participant = Participant.find_by_id(params[:participant_id])
    @scout = Scout.update!(scout_params)
  end

  def show
    @team = current_team
    @event = Event.find_by_id(params[event_id])
    @participant = Participant.find_by_id(params[:participant_id])
    @scout = Scout.update!(scout_params)
    #may not need
  end

  def edit
    @team = current_team
    @event = Event.find_by(params[:event_id])
    @participant = Participant.find_by(params[:participant_id])
    @scout = Scout.find_by_id(params[:id])
  end

  def destroy
    #may not need
  end

  def index
    @team = current_team
    @event = Event.find_by_id(paramsa[event_id])
    @participant = Participant.find_by_id(params[:participant_id])
    @scout = Scout.update!(scout_params)
    #may not need
  end
end
