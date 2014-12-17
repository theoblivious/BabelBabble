class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user
  attr_accessor :current_user

  protected

  def authenticate_user
    if cookies[:user_id]
      self.current_user = User.find(cookies[:user_id])
    end

    # TODO: Move to someting like
    # app_requires_auth = Rails.config.requires_authentication
    app_requires_auth = !Rails.env.development?

    unless app_requires_auth
      # use anonymous user to support current_user interface when not logged in.
      anonymous_user = AnonymousUser.new(name: 'Anonymous')
      self.current_user ||= anonymous_user
    end

    redirect_to login_url, notice: "You must be logged in to access." unless current_user
  end

  # this makes it available to all of our controllers since everything inherits from Application Controller
  # def current_user
  #   @current_user
  # end

  # def current_user=(value)
  #   @current_user = value
  # end

  def user
    @user
  end

  def user=(value)
    @user = value
  end

  # this makes it available to our views.
  helper_method :current_user, :user
end

# created to update score and user for anonymous
class AnonymousUser
  attr_accessor :name, :score
  def initialize(params = {})
    update(params)
  end

  def update(params)
    params.each do |key, value|
      self.send("#{key}=", value)
    end
  end
end
