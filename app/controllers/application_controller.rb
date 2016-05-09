class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    session[:user_id] != nil
  end

  def require_login
    unless session[:user_id]
      redirect_to signin_path
    end
  end

  def set_user
    if logged_in?
      @user = User.find(session[:user_id])
    end
  end

end
