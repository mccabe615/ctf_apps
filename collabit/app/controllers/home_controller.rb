class HomeController < ApplicationController
  before_filter :authenticated
  helper_method :current_user, :authorized_users
  
  def authorized_users
    [
     "ken@ci.com",
     "larry@ci.com",
     "moe@ci.com",
     "curly@ci.com"
     ]
  end
  
  def index
  end
  
  def admin
    render :text => "we will need to restore at some point"
  end
  
  def admin_backup
    file = params[:file] if params[:file]
    if file && File.exists?(file)
     text =  File.read(file).to_s
    else
      text = "Forbidden, only admins hombre"
    end
    render :text => text
  end
  
end
