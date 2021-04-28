class EventsController < ApplicationController

  include UsersHelper

  def new
    @team = current_team
    @event = Event.new
  end

  def create
    @team = current_team
    @event = Event.new(event_params)

    if @event.valid? && @team.id == params[:event][:team_id].to_i
      @event.save
      redirect_to event_path(@event)
    else 
      render "new"
    end
  end

  def update
    @team = current_team
    @event = Event.find_by_id(params[:id])
    if @event.update!(event_params) && @team.id == params[:event][:team_id].to_i
      redirect_to event_path(@event)
    else
      render "edit"
    end
  end

  def show
    @user = current_user
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
