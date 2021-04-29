class ConfirmsController < ApplicationController

  include UsersHelper
  before_action :admin_check
  skip_before_action :admin_check, only: [:show]

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
    @confirm = Confirm.find_by_id(params[:id])
    @confirm = Confirm.update(confirm_params)
    redirect_to event_path(params[:event_id])
  end

  def edit
    @confirm = Confirm.find_by_id(params[:id])
    @user = @confirm.user
    @team = current_team
    @event = @confirm.event
  end

  def index
    @user = current_user
    @team = current_team
    @events = @team.events
    @event = Event.find_by_id(params[:event_id])
    @confirms = @event.confirms
  end

  def show
    @confirm = Confirm.find_by_id(params[:id])
    @user = @confirm.user
    @event = @confirm.event
    @status = @confirm.grades == 0 ? "meets " : "does not meet "
  end

  def destroy
    @user = User.find_by_id(params[:user_id])
    @event = Event.find_by_id(params[:event_id])
    @confirm = find_confirm(@event,@user)
    @confirm.destroy
  end

end
