class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  def logged_in?
    !!current_user
  end
  def admin_user?
    !!current_admin
  end
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
  def require_admin_user
    if !admin_user?
      flash[:danger] = "You must be an admin to perform that action"
      redirect_to admin_login_path
    end
  end
end
