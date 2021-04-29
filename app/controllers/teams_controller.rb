class TeamsController < ApplicationController

  include UsersHelper
  before_action :admin_check
  skip_before_action :admin_check, only: [:show, :index]

  def new
    @team = Team.new
  end

  def create
    @user = current_user
    @team = Team.new(team_params)
    if @team.valid? 
      @team = Team.create!(team_params)
      @user.update(:team_id => @team.id)
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def update
    @team = current_team
    @team.update(team_params)
    redirect_to team_path(@team)
  end

  def show
    @user = current_user
    @team = current_team
    @admin = @team.users.admin.first.username
    @students = @team.users.students
    @events = @team.events
    @tasks = @team.tasks
  end

  def edit
    @user = current_user
    @team = current_team
    @team.update(:name => params[:name])
  end

  def destroy
    @team = current_team
    @user = current_user

    @team.events.each do |x|
      x.participants.each do |y|
        y.destroy
      end
      x.destroy
    end

    @team.tasks.each do |x|
      x.destroy
    end

    @team.users.each do |x|
      x.update!(:team_id => nil)
    end

    @team.destroy
    redirect_to user_path(@user)
  end
end
