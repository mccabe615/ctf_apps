class HomeController < ApplicationController
  before_filter :authenticated
  helper_method :current_user
  
  def index
  end
  
end
