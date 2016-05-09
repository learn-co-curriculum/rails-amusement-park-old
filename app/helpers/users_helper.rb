module UsersHelper
  def display_name_admin_header(user)
    if user.admin
      "<h1 id='user_admin'>ADMIN: #{user.name}</h1>".html_safe
    else
      "<h1>#{user.name}</h1>".html_safe
    end
  end
end