class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :destroy, :is_admin?, :is_super_admin?
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
  def is_admin?
    return false if not current_user
    @is_admin = current_user.admin == true ? true : false
  end
  
  def is_super_admin?
    return false if not current_user
    @is_super_admin = current_user.email == "superadmin@koala_meat.com" ? true : false
  end
  
end
