class HomeController < ApplicationController
  before_filter :authenticated
  helper_method :current_user


  def test
    render :text => %q{
     
      <ul class="status_list">
        <li>
          This is a test !
        </li>
        <li> This is a test </li>
        <li> This is a test </li>
        
        
      </ul>
    }
      
  end
  
end
