class SessionsController < ApplicationController

  def new
  end

  def create
    session[:user_id] = params[:user][:id] # why nested?
    @user = User.find_by(id: params[:user][:id])
    redirect_to @user
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end


end
