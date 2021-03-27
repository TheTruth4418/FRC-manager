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
    @students = [] 
      @team.users.students.each do |x|
          @students << x.username
      end
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
