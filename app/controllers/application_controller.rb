class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # optimize the session checker, dont check the db if already exist a current_user
  end

  def logged_in?
    !!current_user
  end


end
