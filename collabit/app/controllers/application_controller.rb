class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def signed_in?
    return current_user.present?
  end
  
  def authenticated
    redirect_to root_url and reset_session if not signed_in?
  end
  
  def h(str)
    @str = ERB::Util.html_escape(str)
  end
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
