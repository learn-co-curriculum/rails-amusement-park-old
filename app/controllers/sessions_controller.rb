class SessionsController < ApplicationController
  skip_before_action :logged_in?, only: [:new, :create, :index]

  def index

  end

  def new
    @signin_active = "active"
  end

  def create
    @user = User.find(params[:user][:id])
    session[:user_id] = params[:user][:id]
    flash[:success] = "Welcome back #{@user.name}"
    redirect_to user_path(params[:user][:id])
  end

  def delete
    session.delete :user_id
    flash[:info] = "You have been logged out. We hope you enjoyed our creepy amusement park."
    redirect_to root_path
  end
end