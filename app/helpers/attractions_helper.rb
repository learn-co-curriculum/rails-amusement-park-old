module AttractionsHelper
  def admin?
    return "Check out" if @current_user.nil?
    if @current_user.admin
      "Go on"
    else
      "Show"
    end
  end
end