class AdminController < ApplicationController
  helper_method :users
  
  def users
    users = User.all
    user_h = {}
    users.each do |user|
      role = user.admin? ? "Admin" : "User"
      user_h[user.email] = role
    end
     sorted = user_h.sort_by{|k,v| v}
     return sorted
  end
  
  def portal
    check("portal")
  end
  
  def maint
    check("maint")
  end
  
  def mgmt
    check("mgmt")
  end
  
  def edit_user
   @user = User.find_by_email(params[:user_id]) if params[:user_id]
   puts @user.password
   @user_id = params[:user_id] if params[:user_id]
   if not current_user && current_user.admin?
     destroy
   end
  end
  
  private
  
  def check(render_url)
    if current_user && current_user.admin?
      render "#{render_url}"
    else
      destroy
    end
  end
  
end
