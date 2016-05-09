class SessionsController < ApplicationController
  skip_before_action :logged_in?, only: [:new, :create, :index]

  def index

  end

  def new
    @signin_active = "active"
  end

  def create
    # @user = User.find(params[:user][:id])
    session[:user_id] = params[:user][:id]
    redirect_to user_path(params[:user][:id])
  end
end