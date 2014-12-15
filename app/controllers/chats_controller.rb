class ChatsController < ApplicationController
  def room
    # redirect_to login_path unless current_user
    # TODO: configure via Figaro
    app_requires_auth = Rails.env.development?
    # TODO: Move to someting like
    # app_requires_auth = Rails.config.requires_authentication
    redirect_to login_path if app_requires_auth && !current_user
  end
end
