class SessionsController < ApplicationController
  
  def new
    reset_session
  end

  # I've added some logic both in the model and in this
  # ...controller to allow for an email enumeration vuln.
  def create
    reset_session
    user = User.authenticate(params[:email], params[:password])
    if user && user.kind_of?(User)
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash.now.alert = "#{user}"
      render "new"
    end
  end

  def destroy
    reset_session
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
