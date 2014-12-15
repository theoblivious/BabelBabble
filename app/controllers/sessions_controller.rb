class SessionsController < ApplicationController
  skip_before_action :authenticate_user, except: [:destroy]

  def index
  end

  def new
  end


  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    self.current_user = user
    Rails.logger.info "current_user=#{self.current_user}"
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
