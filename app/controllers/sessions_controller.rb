class SessionsController < ApplicationController

  include UsersHelper

  def new
      
  end

  def create
      @user = User.find_by(:username => params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to "/home"
      else
          redirect_to '/'
      end
  end

  def destroy
    session.clear
    redirect_to "/"
  end
end