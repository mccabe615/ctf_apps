class HomeController < ApplicationController
  
  def new
  end
  
  def index
    flash[:info] = "Congratulations! You\'ve broken into the superadmin account. Your key is #{SECRET_TOKEN_4}" if current_user && is_super_admin?
  end
  
  def catalog
   @photos =[]
   (1..9).each {|i| @photos.push("kb#{i}.jpg")}
  end
  
  # Nothing needed here
  def contact_us
  end
  
  # Nothing needed here
  def about_us
  end
  
  def show_catalog_item
    @catalog_item = Catalog.find_by_item_num(params[:cat_id])
    if !@catalog_item 
      redirect_to catalog_path
    end
  end

end
