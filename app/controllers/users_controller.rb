class UsersController < ApplicationController

  include UsersHelper
  skip_before_action :login_check, only: [:new, :create, :welcome]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to "/login"
      flash[:notice] = 'Account created, please login!'
    else 
      render "new"
    end

  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
    flash[:notice] = 'Admin Status has been changed.'
  end

  def show
      @user = current_user
      @team = current_team
      @status = status(@user)
  end

  def edit
    @user = current_user
    @teams = Team.all
  end

  def destroy
  end

  def welcome
  end

  def join
    @user = current_user
    @teams = Team.all.by_name
    if @user.admin == nil
      redirect_to edit_user_path(@user)
      flash[:notice] = 'Need to set admin status first!'
    end
  end

  def register
      @user = current_user
      @user.update(:team_id => params[:team][:id])
      @team = current_team
      @team.users.students << current_user
      render "show"
  end

  def remove
    @student = User.find_by_id(params[:user][:id])
    @student.update!(:team_id => nil)
    redirect_to team_path(current_team)
  end
end

