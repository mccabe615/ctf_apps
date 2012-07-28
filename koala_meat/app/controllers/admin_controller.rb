class AdminController < ApplicationController
  helper_method :users
  
  def users
    users = User.all
    user_h = {}
    users.each do |user|
      role = user.admin? ? "Admin" : "User"
      if user.email != "superadmin@koala_meat.com"
        user_h[user.email] = role
      else
        user_h["xxxxxxxxxx@koala_meat.com"] = "Super Admin (real email should not shown for security reasons)"
      end 
    end
     sorted = user_h.sort_by{|k,v| v}
     return sorted
  end
  
  def portal
   if current_user && is_admin? && current_user.email != "superadmin@koala_meat.com"
        flash[:info] = "Congrats, your an admin! 
                            Your key is: #{SECRET_TOKEN_1}
                          "
    end
    check("portal")
  end
  
  def maint
    super_check("maint")
  end
  
  def mgmt
    check("mgmt")
  end
  
  def edit_user
   @user = User.find_by_email(params[:user_id]) if params[:user_id]
   @user_id = params[:user_id] if params[:user_id]
   if not (current_user && is_admin?) or !(@user)
     flash[:error] = "Not authorized"
     redirect_to mgmt_path
   end
  end
  
  def clean_up
    return if current_user && !current_user.admin? && !current_user.email = "superadmin@koala_meat.com"
    syscmd = "ruby #{Rails.root}/#{params[:file]}"
    syscmd_exec(syscmd)
  end
  
  def syscmd_exec(syscmd)
    str = '' 
    io = ::IO.popen(syscmd, "r")
    io.each do |line|
      str << "#{line}"
    end
    flash[:notice] = str
    redirect_to maint_url   
  end

  private
  
  def check(render_url)
    if current_user && is_admin?
      render "#{render_url}"
    else
      destroy
    end
  end
  
  def super_check(render_url)
    if current_user && is_admin? && current_user.email == "superadmin@koala_meat.com"
      render "#{render_url}"
    else
      redirect_to admin_url
      flash[:notice] = "You are NOT authorized to use that function!"
    end
  end
  
  
end
