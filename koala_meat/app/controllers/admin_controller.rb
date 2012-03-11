class AdminController < ApplicationController
  helper_method :users
  
  def users
    @users = User.all
    return @users
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
  
  private
  
  def check(render_url)
     if current_user && current_user.admin?
      render "#{render_url}"
    else
      redirect_to root_url
    end
  end
  
end
