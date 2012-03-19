class UsersController < ApplicationController
 
 def new
    @user = User.new
 end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      render "new"
    end
  end
  
  def update
     if current_user && current_user.admin?
      puts "admin"
      @user = User.find(params[:id])
         if @user.update_attributes(params[:user])
            flash[:success] = "Profile updated"
            redirect_to mgmt_url
         end
     else
        destroy
     end 
  end
  
  def self.role_bool
     return [true, false]
  end
  
  def forgot_password
     
  end

end
