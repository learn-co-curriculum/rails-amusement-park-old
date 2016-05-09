module AttractionsHelper
  def admin?
    if @current_user.admin
      "Go on"
    else
      "Show"
    end
  end
end