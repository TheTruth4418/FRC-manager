class EventsController < ApplicationController

  include UsersHelper

  def new
    @team = current_team
    @event = @team.events.build
  end

  def create
    @team = current_team
    @students = @team.users.students
    @event = Event.create!(event_params)
    @participants = @event.participants
    render "show"
  end

  def update
    @team = current_team
    @event = Event.find_by_id(params[:id])
    @event.update(event_params)
    @participants = @event.participants
    @students = @team.users.students
    render "show"
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
    @event.participants.each do |x|
      x.destroy
    end
    @event.confirms.each do |x|
      x.destroy
    end
    @event.destroy
    redirect_to team_path(current_team)
  end

  def index
    @events = @team.events
  end
end
