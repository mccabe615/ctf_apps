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
  end
  
  # 
  def self.role_bool
     return [true, false]
  end

end
