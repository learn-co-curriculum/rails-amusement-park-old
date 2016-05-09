class HomeController < ApplicationController
  before_action :logged_in?
  before_action :set_user

  def index
  end
end
