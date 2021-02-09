module ApplicationHelper

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def require_session
    unless current_user
      redirect_to signin_path, :alert => 'Sign Up or Sign In to access this feature!'
    end
  end

  def navbar_links
    html_out = ''
    if session[:user_id]
      html_out << "<li class=\"nav-item\"><%= link_to 'Sign Out', signout_path, class: 'nav-link' %></li>"
      html_out << "<%= link_to 'Create Event', new_event_path, class: 'nav-link' %>"
      html_out << "<li class=\"nav-item\"><%= link_to @current_user.username, user_path(current_user) , class: 'nav-link' %></li>" if @current_user
    else
      html_out << "<li class=\"nav-item\"><%= link_to 'Sign In', signin_path, class: 'nav-link' %></li>"
      html_out << "<li class=\"nav-item\"><%= link_to 'Sign Up', signup_path, class: 'nav-link' %></li>"
    end
    render inline: html_out
  end
end
