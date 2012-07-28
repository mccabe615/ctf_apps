class SessionsController < ApplicationController
  
  def new
    reset_session
  end
  
  def index
    redirect_to root_path
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
      if params[:email] == "superadmin@koala_meat.com"
         flash[:info] = "You\'ve enum\'d an important account, your key is: #{SECRET_TOKEN_2}"
         render "new"
      else
        flash[:error] = "#{user}"
        render "new"
      end
    end
  end

  def destroy
    reset_session
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
