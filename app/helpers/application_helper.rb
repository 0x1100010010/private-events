module ApplicationHelper

  def require_session
    unless current_user
      redirect_to login_path, :alert => 'Sign up or Log in to access this feature!'
    end
  end

  def navbar_links
    html_out = ''
    if session[:user_id]
      html_out << "<li class=\"nav-item\"><%= link_to 'Sign Out', sessions_signout_path, class: 'nav-link' %></li>"
      html_out << "<li class=\"nav-item\"><%= link_to current_user.username, root_path , class: 'nav-link' %></li>"
    else
      html_out << "<li class=\"nav-item\"><%= link_to 'Sign In', sessions_signin_path, class: 'nav-link' %></li>"
      html_out << "<li class=\"nav-item\"><%= link_to 'Sign Up', sessions_signup_path, class: 'nav-link' %></li>"
    end
    render inline: html_out
  end
end
