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
  
  # putting email enumeration in here as well
  def forgot_password
     flash.clear
     if request.post? && !params[:email].nil? && !params[:email].empty?
        email = User.find_by_email(params[:email])
        if !email.nil?
           # This is stubbed code, needs to basically have a method which sends an email to our contestant
           flash[:success] = "Email sent!"
        elsif email.nil?
           flash[:failure] = "Email not found"
        end 
      elsif (request.post?) && (params[:email].nil? || params[:email].empty?)
         render :text => "<script>alert('Nice Try Pal')</script>"
      end 
  end
  

end
