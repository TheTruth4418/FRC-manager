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

  def omniauth
    @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
      u.username = auth['info']['email']
      u.uid = auth[:uid]
      u.provider = auth[:provider]
      u.password = SecureRandom.hex(10)
    end
  
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to "/"
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end