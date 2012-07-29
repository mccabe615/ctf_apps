class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticated

  helper_method :current_user, :params_blank?, :passed?, :current_user_team_id, :all_roles
  helper_method :current_user_team, :current_user_role, :user_role_by_name, :all_teams
  helper_method :pending_review_statuses, :is_admin?
  
  
  
  def is_admin?
    @is_admin = current_user_role == "admin" ? true : false
  end
  
  def admin
   redirect_to root_url and reset_session if not (is_admin?)
  end
  
  def signed_in?
    if current_user
      return true
    else
      return false
    end
  end
  
  def authenticated
    redirect_to root_url and reset_session if not signed_in?
  end
  
  def h(str)
    @str = ERB::Util.html_escape(str)
  end
  
  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
  
  def all_roles
    roles = Roles.all
    return roles
  end 
  
  def user_role_by_name(id)
    name = ""
    return name unless id
    name = Roles.find_by_id(id).name if Roles.find_by_id(id).respond_to?("name")
    return name
  end 
  
  def all_teams
    at = Teams.all
    return at
  end
  
  def current_user_team
     team = nil
     if current_user
       team_name = current_user.team
       verified_team_exists = Teams.find_by_name(team_name)
       team = verified_team_exists.name if verified_team_exists.respond_to?('name')
     end 
     return team
  end
  
  def current_user_team_id
     team = nil
     if current_user
       team_name = current_user.team
       verified_team_exists = Teams.find_by_name(team_name)
       team = verified_team_exists.id if verified_team_exists.respond_to?('id')
     end 
     return team
  end
  
  def current_user_role
    role = nil
    if current_user
      role_id = current_user.role
      role_name = Roles.find_by_id(role_id)
      role = role_name.name if role_name.respond_to?('name')
    end
    return role
  end
    
  def params_blank?(params={})
    return true if params.empty?
    blank = []
    params.map {|k,v| blank <<(k) if v.blank?}    
    if blank.empty?
      return false
    else 
      return true
    end
  end 
  
  def passed?(action='', params={})
    return false if (action.empty? || params.empty?)
    result = nil
    case action
    when "save_profile"
      result = check_save_parameters(params)
    end 
    return result
  end
  
  def is_manager?(uid=nil)
    return false if uid.nil?
    r = User.find_by_user_id(uid).role
    role = Roles.find_by_id(r).name == "manager" ? true : false
    return role
  end 
  
  def pending_review_statuses
    return [] if current_user.nil?
    if current_user_team == "Corporate"
      ar = Status.find(:all, :conditions => {:reviewed => false, :submitted => true})
      awaiting_review = ar.select { |x| x if is_manager?(x.last_edited_by) }
    else
      ar = Status.find(:all, :conditions => {:team_number => current_user_team_id, :reviewed => false}) if current_user && current_user_team_id
      awaiting_review = ar.select { |x| x if not x.last_edited_by == current_user.user_id}
    end
    return awaiting_review
  end
  
  def choose_statuses_by_id(statuses=[])
    return [] if (statuses.empty? || !statuses.kind_of?(Array))
    reports, report_numbers = [], []
    statuses.each do |item|
      item.each { |k, v|  report_numbers<<(v)}
    end
    if current_user_team == "Corporate"
      r = Status.find(:all, :conditions => {:id => report_numbers, :submitted => true, :reviewed => false})
      reports = r.select { |x| x if is_manager?(x.last_edited_by) }
    else
      reports = Status.find(:all, :conditions => {:id => report_numbers, :team_number => current_user_team_id, :reviewed => false}) if current_user && current_user_team_id
    end
    return reports
  end



end
