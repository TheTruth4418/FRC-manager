class TeamsController < ApplicationController
  def new
  end

  def create
    @team = Team.create!(team_params)
    @user = current_user
    @user.update(:team_id => @team.id)
    if @team
      render "creation"
    end
    #error validation in forms
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
    render :layout => "users"
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
