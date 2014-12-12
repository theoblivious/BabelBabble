class SessionsController < ApplicationController
  def index
  end

  def new
  end


  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    current_user = user
    cookies[:user_id] = user.id
    flash[:success] = "Hello, #{user.name}!"
    redirect_to "/chatroom"
  end

  def destroy
    cookies.delete(:user_id)
    flash[:success] = "See you!"
    redirect_to root_url
  end

  protected

  def auth_fail
    render text: "You've tried to authenticate via #{params[:strategy]}, but the following error occurred: #{params[:message]}", status: 500
  end


end
