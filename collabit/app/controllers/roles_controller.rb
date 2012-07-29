class RolesController < ApplicationController
  
  before_filter :authenticated, :admin
  
  helper_method :roles_by_name
  
  private
  
  def roles_by_name
    rbn = Roles.find(:all, :select => "name").map(&:name)
    return rbn
  end 
  
end
