class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
    @signup_active = "active"
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end