class StatusController < ApplicationController
  before_filter :authenticated
  helper_method :statuses
  
  def create
    @status = Status.new
    render :layout => "create"
  end
  
  def view_before_save
    if !(params[:status][:week_ending].blank?) && !(params[:status][:title].blank?) && !(params[:status][:status].blank? || params[:status][:status] == "<br/>")      
      @details = {:we => params[:status][:week_ending], :title => params[:status][:title], :status => params[:status][:status]}   
    else
      redirect_to create_path
      flash[:notice] = "Sorry Charlie, your report is missing something"
    end
  end
  
  def save_status
    if !(params[:week_ending].blank?) && !(params[:title].blank?) && !(params[:status].blank? || params[:status][:status] == "<br/>")    
      status = params[:id].present? ? Status.find_by_id(params[:id]) : Status.new
      if status
        status.title = params[:title]
        status.week_ending  = params[:week_ending]
        status.status = params[:status]
        status.team_number = current_user.roles.to_i
        status.last_edited_by = current_user.user_id
        status.save!
        if params[:id]
          flash[:notice] = "Awesome, you found a flaw in logic - key: th1sk3y1spr3333333tyr1ght348482828"
        end
      end 
    else
      redirect_to create_path
      flash[:notice] = "You did something out of order"
    end
  end
  
  def latest_updates
    str = ''
    status = Status.all
    nstatus = status.last(5).sort_by{ |update| update.updated_at}.reverse
    str << "<ul class=\"status_list\">"
    nstatus.each do |update|
    str << "<li>\"#{h(update.title[0..30])}\" was updated by: #{h(editor(update.last_edited_by))}</li>"   
    end
    str << "</li>"
    render :text => str
      
  end
  
  def editor(num=0)
    writer = User.find_by_user_id(num)
    return writer.email
  end
  
  def statuses
    @stats = Status.all.sort_by{ |update| update.updated_at}.reverse
  end
  
  def single_status(id)
   return Status.find_by_id(id) if id
  end
  
  def view_status
   @ss = single_status(params[:id]) if params[:id]
   if !@ss
     redirect_to home_path
   end
  end
  
  def view_statuses
    if !statuses
      render :text => "boo"
    end
  end
  
  def edit_status
    @single_s = single_status(params[:id]) if params[:id]
    if @single_s.present? && (current_user.roles.to_i == @single_s.team_number)
      render :layout => "create"
    else
      flash[:notice] = "You do not have permissions to edit this team's status"
      redirect_to home_url
    end 
  end

end
