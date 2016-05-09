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
      "<button id='Go on this ride' class='btn btn-primary btn-lg' onclick='window.location.href=\"#{ride_path(@attraction)}\"'>Go on this ride</button>".html_safe
    else
       "<a class='btn btn-primary btn-lg' href= '#{edit_attraction_path(@attraction)}' role='button'>Edit Attraction</a>".html_safe
    end
  end
end