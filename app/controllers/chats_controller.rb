class ChatsController < ApplicationController
  def room
    redirect_to login_path unless session[:user]
  end
end
