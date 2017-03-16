class UsersController < ApplicationController
  
  skip_before_action :logged_in?, only: [:new, :create]

  def index

  end

  def show
    @user = User.find(params[:id])
    @show_active = "active" if @user.id == @current_user.id
  end

  def new
    @user = User.new
    @signup_active = "active"
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    flash[:success] = "Congrats. You've sucessfully created an account."
    redirect_to user_path(@user)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
    flash[:success] = "Congrats. You've sucessfully updated the account."
    redirect_to user_path(@user)
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin)
    #user_admin is not nested
  end

end