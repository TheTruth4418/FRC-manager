class EventsController < ApplicationController

  include UsersHelper

  def new
    @team = current_team
    @event = @team.events.build
  end

  def create
    @team = current_team
    @event = Event.create!(event_params)
    render "show"
  end

  def update
    @team = current_team
    @event = Event.update(event_params)
    @event = Event.find_by_id(params[:id])
  end

  def show
    @team = current_team
    @event = Event.find_by_id(params[:id])
    @participants = @event.participants
    @students = @team.users.students
  end

  def edit
    @event = Event.find_by_id(params[:id])
    @team = current_team
  end

  def destroy
    @event = Event.find_by_id(params[:id])
    @event.destroy
  end

  def index
    @events = @team.events
  end
end
