class UsersController < ApplicationController

  include UsersHelper

  def new
  end

  def create
    @user = User.create!(user_params)
    if @user
      session[:user_id]=@user.id
      redirect_to "/login"
      flash[:notice] = 'Account created, please login!'
    else
    redirect_to "/signup"
    flash[:notice] = 'Account couldnt be created, please try again.'
    end
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to "/home"
    flash[:notice] = 'Your Username has been successfully changed.'
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
  end

  def destroy
  end

  def welcome
  end
end

# if logged in redirect to the home
