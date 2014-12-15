class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
# this makes it available to all of our controllers since everything inherits from Application Controller
  def current_user
    # use anonymous user to support current_user interface when not logged in.
    anonymous_user = OpenStruct.new(name: 'Anonymous')
    @current_user ||= anonymous_user
  end

  def current_user=(value)
    @current_user = value
  end
# this makes it available to our views.
  helper_method :current_user
end
