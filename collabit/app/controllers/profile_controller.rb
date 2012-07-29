class ProfileController < ApplicationController

def new
  
end

def edit
  
end 

def passwords_match?(params={})
   match = params[:password_confirmation] == params[:password] ? true : false
   return match
end 

def email_available?(params={})
  return true if params[:email].to_s == current_user.email
  return false if params[:email].nil?
  email_avail = User.find_by_email(params[:email].to_s).nil?
  return email_avail
end

def check_save_parameters(params={})
    @notice = ""
  if params_blank?(params)
     @notice = "Please fill out all form fields"
     return false
  end 
  
  if not email_available?(params)
    @notice = "Please choose either a different email or password"
    return false
  end 

  if not passwords_match?(params)
     @notice = "Your passwords do not match"
     return false
  end 
  
  return true
end 


def save
  if passed?("save_profile", params)
    if params[:password_confirmation] == params[:password] && !User.find_by_email(params[:email].to_s).nil?
      current_user.email = params[:email]
      current_user.password = params[:password]
      current_user.password_confirmation = params[:password_confirmation]
      current_user.save!
      @notice = "Profile successfully saved!"
    end
  end 
  redirect_to edit_profile_path, :flash => {:success => @notice }
end

def view
  render :text => "Hi, ya!"
end 

end
