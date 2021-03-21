class ConfirmsController < ApplicationController
  def new
    @user = current_user
    @team = current_team
    @events = @team.events
    @event = Event.find_by_id(params[:event_id])
  end

  def create
    @user = current_user
    @team = current_team
    @events = @team.events
    @event = Event.find_by_id(params[:event_id])
    @confirm = Confirm.create!(confirm_id)
  end

  def update
    @user = current_user
    @team = current_team
    @events = @team.events
    @event = Event.find_by_id(params[:event_id])
    @confirm = Confirm.update!(confirm_id)
  end

  def edit
    @user = current_user
    @team = current_team
    @events = @team.events
    @event = Event.find_by_id(params[:event_id])
    @confirm = Confirm.find_by_id(params[:id])
  end

  def index
    @user = current_user
    @team = current_team
    @events = @team.events
    @event = Event.find_by_id(params[:event_id])
    @confirms = @event.confirms
  end

  def destroy
    @user = current_user
    @team = current_team
    @events = @team.events
    @event = Event.find_by_id(params[:event_id])
    #destroy the confirm
  end

end
