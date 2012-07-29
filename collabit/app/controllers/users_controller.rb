class UsersController < ApplicationController
  
  before_filter :authenticated, :admin
  
  helper_method :users, :roles, :teams

  def new
    @user = User.new
  end

  def create
    @user = User.new()
    required_user_params = [:password, :password_confirmation,:email]
    required_params = [:team, :role]
    rup = check_required_params(params, required_user_params)
    rp = check_required_params(params, required_params)
    if not (rup || rp) == false
      @user.email = params[:user][:email]
      @user.user_id = available_id
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
      @user.team = params[:team]
      @user.role = params[:role]
    end 
    
    if @user.save 
      flash[:success] = "User Created!"
      redirect_to admin_path
    else
      flash[:error] = "User not created"
      render "new"
    end
  end
  
  # Returns true if all required params we submitted or false if not
  def check_required_params(params={}, req_params={})
    return false if (params || req_params).empty?
  end
  
  def edit
   users
  end

  
  def modify
    redirect_to edit_users if not params[:id]
    id = params[:id].to_s
    @user = User.find_by_id(id)
  end 
  
  def teams
    teams = sort_teams_by_user(id, @user)
  end 
  
  def roles
    @roles = sort_roles_by_user(id, @user)
  end
  
  def save
    if !params_blank?(params) && !params[:id]
      flash[:error] = "Something went wrong :-("
      render "edit"
    else
      user = User.find_by_id(params[:id])
      user.email = params[:email]
      user.team = params[:team]
      user.role = params[:role]
      if user.save!
        redirect_to edit_users_path, :flash => {:success => "Succesfully Saved!"}
      end
    end 
  end 
  
  def delete
    user = User.find_by_id(params[:id]) if params[:id]
    if user and not (params[:id] == current_user.id.to_s)
        user.delete
        flash[:success] = "User succesfully deleted"
      else
        flash[:error] = "Cannot delete this user"
    end
    redirect_to edit_users_path
  end
  
  private
  
  def available_id
    last_id = User.find(:all, :select => "user_id").map(&:user_id).last
    if not last_id.nil?
      last_id = last_id + 1
    else
      return 1
    end
    return last_id
  end 
  
  def users
    @users = User.all
  end
  
  
  def sort_roles_by_user(id, user)
    r = []
    roles = Roles.find(:all).delete_if {|x| x.id == user.role }
    rbid = Roles.find_by_id(user.role)
    r.concat(roles).unshift(rbid)
    return r
  end
  
  def sort_teams_by_user(id, user)
    t = []
    teams = Teams.find(:all).delete_if {|x| x.name == user.team }
    tbid = Teams.find_by_name(user.team)
    t.concat(teams).unshift(tbid)
    return t
  end
  
end
