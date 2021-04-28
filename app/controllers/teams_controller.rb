class TeamsController < ApplicationController

  include UsersHelper

  def new
    @teams = Team.all.by_name
  end

  def create
    @user = current_user
    if status(@user) == "admin"
      @team = Team.create!(team_params)
      @user.update(:team_id => @team.id)
      #error validation
    else
      @user.update(:team_id => params[:team][:id])
      @team = current_team
      #error validation
    end
    redirect_to user_path(@user)
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

# @team.users pulls up all the users for the team
# Admin CRUD team students R team
# Events can be viewed by the students however admin can create an event
# Admin can fully CRUD a task but a student can only update and read a task
# Admins can CRUD Opponents, Users can RU opponents scout reports
# Confirms are CRUD by admins while students can CRU a confirm, confirming their event participation
# change the url names later on
