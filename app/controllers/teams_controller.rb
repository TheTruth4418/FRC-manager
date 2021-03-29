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
    render "show"
  end

  def update
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
  end

  def destroy
    current_team.destroy
  end

  def join
    @teams = Team.all.by_name
  end

  def register
      @user = current_user
      @user.update(:team_id => params[:team][:id])
      @team = current_team
      render "success"
  end
end

# @team.users pulls up all the users for the team
# Admin CRUD team students R team
# Events can be viewed by the students however admin can create an event
# Admin can fully CRUD a task but a student can only update and read a task
# Admins can CRUD Opponents, Users can RU opponents scout reports
# Confirms are CRUD by admins while students can CRU a confirm, confirming their event participation
# change the url names later on
