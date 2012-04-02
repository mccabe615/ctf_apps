class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :destroy
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
