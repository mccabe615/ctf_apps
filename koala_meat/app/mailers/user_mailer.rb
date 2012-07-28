class UserMailer < ActionMailer::Base
  default :from => "support@koala_meat.com"
  
  def forgot_password_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
  
end
