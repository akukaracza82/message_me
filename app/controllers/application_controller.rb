class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  #helper_method are methods, which will will become a part of applicationhelper
  #and therefore will ba available in views

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
