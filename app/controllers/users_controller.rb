class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create!(user_params)
    if @user
      session[:user_id]=@user.id
      #redirect_to "/login"
      flash[:notice] = 'Account created, please login!'
    end
    #error validation
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
      @team = @user.team
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
