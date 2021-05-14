class ConfirmsController < ApplicationController

  include UsersHelper
  before_action :admin_check, :students_check
  skip_before_action :admin_check, only: [:show]

  def new
    @team = current_team
    @event = Event.find_by_id(params[:event_id])
    @students = @team.users.students
    @confirm = Confirm.new
  end

  def create
    @team = current_team
    @event = Event.find_by_id(params[:event_id])
    @confirm = Confirm.new(confirm_params)
    if params[:confirm][:event_id].to_i == @event.id && @confirm.valid?
      @confirm.save
      redirect_to event_path(@event)
    else
      @students = @team.users.students
      render "new"
    end
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
