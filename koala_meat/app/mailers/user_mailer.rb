class UserMailer < ActionMailer::Base
  default :from => "KM Support <support@koala_meat.com>"
  
  def forgot_password_email(*params)
    @pass, @user, @url = params
    mail(:to => @user.email, :subject => "#{@user.email}, here is your forgotten password")
  end
  
end
