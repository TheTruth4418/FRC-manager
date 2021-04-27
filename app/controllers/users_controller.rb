class UsersController < ApplicationController

  include UsersHelper

  def new
  end

  def create
    @user = User.create!(user_params)
    session[:user_id]=@user.id
    redirect_to "/login"
    flash[:notice] = 'Account created, please login!'
    if !@user 
      redirect_to "/signup"
      flash[:notice] = 'Account couldnt be created, please try again.'
    end
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
    flash[:notice] = 'Admin Status has been changed.'
  end

  def show
    if logged_in?
      @user = current_user
      @team = current_team
      @status = status(@user)
    else
      redirect_to "/"
    end
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
end

