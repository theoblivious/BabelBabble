class ChatsController < ApplicationController
  def room
    redirect_to login_path unless cookies[:user_id]
  end
end
