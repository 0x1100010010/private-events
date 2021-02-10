module ApplicationHelper
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def require_session
    redirect_to signin_path, alert: 'Sign Up or Sign In to access this feature!' unless current_user
  end

  def navbar_links
    html_out = ''
    if session[:user_id]
      html_out << "<li class=\"nav-item\"><%= link_to 'Sign Out', signout_path, class: 'nav-link px-3' %></li>"
      html_out << "<%= link_to 'Create Event', new_event_path, class: 'nav-link px-3' %>"
      if @current_user
        html_out << "<li class=\"nav-item\"><%= link_to @current_user.username, user_path(current_user) ,
                       class: 'nav-link px-3' %></li>"
      end
    else
      html_out << "<li class=\"nav-item\"><%= link_to 'Sign In', signin_path, class: 'nav-link px-3' %></li>"
      html_out << "<li class=\"nav-item\"><%= link_to 'Sign Up', signup_path, class: 'nav-link px-3' %></li>"
    end
    render inline: html_out
  end

  def render_notifications
    html_out = ''
    if flash[:notice]
      html_out << "<div class=\"alert-success alert-dismissible fade show text-center sticky-top\" role=\"alert\">
      <strong><%= notice %></strong></div>"
    else
      flash[:alert]
      html_out << "<div class=\"alert-warning alert-dismissible fade show text-center sticky-top\" role=\"alert\">
      <strong><%= alert %></strong></div>"
    end
    render inline: html_out
  end
end
