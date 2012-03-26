class HomeController < ApplicationController
  
  def index
    redirect_to "/welcome" if !current_user.nil?
  end
  
  def welcome
   current_user = session[:user_id]
   redirect_to root_url if current_user.nil?
   return if current_user.nil?
  end
  
  def catalog
  end
  
  def contact_us
  end
  
  def about_us
  end

end
