class UsersController < ApplicationController
 
 def new
    @user = User.new
 end
  
  def create
    @user = User.new(params[:user])
    if @user.save 
      flash[:success] = "Account Created!"
      redirect_to root_path
    else
      flash[:info] = @user.email == "superadmin@koala_meat.com" ? "You\'ve enum\'d an important account, your key is: #{SECRET_TOKEN_2}" : "User not created"
      render "new"
    end
  end
  
  def update
     if current_user && is_admin?
        @user = User.find(params[:id])
           if @user.email != "superadmin@koala_meat.com" && @user.update_attributes(params[:user])
              flash[:success] = "Profile updated"
            else 
              flash[:error] = "Nice try :-)"
           end
     end 
     redirect_to  mgmt_path
  end
  
  def self.role_bool
     return [true, false]
  end
  
  # putting email enumeration in here as well
  def forgot_password
     if request.post? && !params[:email].nil? && !params[:email].empty?
        email = User.find_by_email(params[:email])
        if !email.nil?
           generate_and_change_password(params[:email])
           flash[:success] = email.email == "superadmin@koala_meat.com" ? "You\'ve enum\'d an important account, your key is: #{SECRET_TOKEN_2}, Email sent!": "Email sent!"
        elsif email.nil?
           flash[:error] = "Email not found"
        end 
      elsif (request.post?) && (params[:email].nil? || params[:email].empty?)
           flash[:error] = "Email not found"
      end 
  end
  
  def generate_and_change_password(email)
     first_word = ['C', 'T', 'F', 'ARE', 'FUN']
     second_word = ['APP', 'SEC', 'IS', 'GOOD', 'TIMES']
     four_digits = ['1337', '1445', '29', '42', '1']
     random_pass = first_word[rand(first_word.length)] + four_digits[rand(four_digits.length)] + second_word[rand(second_word.length)].to_s
     user = User.find_by_email(email)
     user.encrypt_password(random_pass)
     user.save!
     email_password(random_pass, user)
  end
  
  def email_password(pass, user)
     #Stubbed, have to do something here to actually email this stuff out
      UserMailer.forgot_password_email(pass, user, log_in_url).deliver
  end
  
  def test
     render :text => "Here is your key: #{SECRET_TOKEN_1}"
  end
  

end
