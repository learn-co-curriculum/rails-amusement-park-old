class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :logged_in?
  skip_before_action :logged_in?, only: [:index, :root_path, :new_user_path]


  private
  def logged_in?
    redirect_to signin_path unless !!session[:user_id]
    @current_user = current_user
  end

  def current_user
    User.find(session[:user_id])
  end

end
