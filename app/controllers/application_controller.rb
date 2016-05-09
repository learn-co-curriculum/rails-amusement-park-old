class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :logged_in?, :set_current_user


  private
  def logged_in?
    if session[:user_id].nil?
      redirect_to signin_path 
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

end
