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
      if params[:email] == "superadmin@koala_meat.com"
         flash.now.alert = %q{You've enum'd an important account, your key is: 2093902902939-adsfja;awekif=238dfasdf93-1!#@#}
         render "new"
      else
        flash.now.alert = "#{user}"
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
