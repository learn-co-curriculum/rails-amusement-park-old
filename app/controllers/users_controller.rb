class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :edit]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to @user, notice: "Welcome to the theme park!"
  end

  def update
    @user.update(user_params)
    redirect_to @user, notice: "User was successfully updated."
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
