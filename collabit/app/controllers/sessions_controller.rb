class SessionsController < ApplicationController

  skip_before_filter :authenticated
  
  def index
    redirect_to root_path
  end 
  
  def new
    redirect_to home_url if current_user
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to home_url
    else
      flash[:error] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :flash => {:info => "Logged out!"}
  end

end
