class ChatsController < ApplicationController
  def room
    redirect_to login_path unless current_user
  end
end
