class UsersController < ApplicationController
 
 def new
    @user = User.new
 end
  
  def create
    @user = User.new(params[:user])
    if @user.save 
      flash[:success] = "Account Created!"
      redirect_to welcome_path
    else
      flash[:error] = @user.email == "superadmin@koala_meat.com" ? %q{You've enum'd an important account, your key is: 2093902902939-adsfja;awekif=238dfasdf93-1!#@#} : "User not created"
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
     flash.clear
     if request.post? && !params[:email].nil? && !params[:email].empty?
        email = User.find_by_email(params[:email])
        if !email.nil?
           generate_and_change_password(params[:email])
           flash[:success] = "Email sent!"
        elsif email.nil?
           flash[:error] = "Email not found"
        end 
      elsif (request.post?) && (params[:email].nil? || params[:email].empty?)
           flash[:error] = "Email not found"
      end 
  end
  
  def generate_and_change_password(email)
     first_word = ['AS', 'DC', 'CTF', '20', '12']
     second_word = ['OWA', 'SP', 'CONF', 'EREN', 'CE']
     four_digits = ['1337', '1445', '702', '918', '1600']
     random_pass = first_word[rand(first_word.length)] + four_digits[rand(four_digits.length)] + second_word[rand(second_word.length)].to_s
     #puts random_pass
     user = User.find_by_email(email)
     user.encrypt_password(random_pass)
     user.save!
     email_password(random_pass)
  end
  
  def email_password(pass)
     #Stubbed, have to do something here to actually email this stuff out
  end
  
  def test
     render :text => "Here is your key: shabadabadoo2343343234556992308423"
  end
  

end
