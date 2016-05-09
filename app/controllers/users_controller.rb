class UsersController < ApplicationController
  
  skip_before_action :logged_in?, only: [:new, :create]

  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @signup_active = "active"
    session[:id] = @user.id
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to user_path(@user)
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets)
  end

end