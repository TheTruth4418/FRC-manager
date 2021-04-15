class ConfirmsController < ApplicationController

  include UsersHelper

  def new
    @user = current_user
    @team = current_team
    @event = Event.find_by_id(params[:event_id])
    @students = @team.users.students
  end

  def create
    @user = current_user
    @team = current_team
    @event = Event.find_by_id(params[:event_id])
    @confirm = Confirm.create!(confirm_params)
    redirect_to event_path(@event)
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
