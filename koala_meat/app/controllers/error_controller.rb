class ErrorController < ApplicationController
  
  def handle404
    redirect_to root_path
  end
  
end
