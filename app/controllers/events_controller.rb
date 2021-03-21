class EventsController < ApplicationController
  def new
    @team = current_team
    @event = @team.events.build
  end

  def create
    @team = current_team
    @event = Event.create!(event_params)
  end

  def update
    @team = current_team
    @event = Event.update(event_params)
    @event = Event.find_by_id(params[:id])
  end

  def show
    @event = Event.find_by_id(params[:id])
    @opponents = @event.opponents
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
