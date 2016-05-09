module AttractionsHelper
  def admin?
    return "Check out" if @current_user.nil?
    if !@current_user.admin
      "Go on"
    else
      "Show"
    end
  end

  def ride_or_edit?
    if !@current_user.admin
      "<a class='btn btn-primary btn-lg' href= '<%=ride_path(@attraction) %>' role='button'>Go on this ride</a>".html_safe
    else
       "<a class='btn btn-primary btn-lg' href= '<%=edit_attraction_path(@attraction) %>' role='button'>Edit Attraction</a>".html_safe
    end
  end
end