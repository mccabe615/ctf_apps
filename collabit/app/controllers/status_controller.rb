class StatusController < ApplicationController
  before_filter :authenticated
  helper_method :statuses, :last_edited_by_email
  
  def create
    @status = Status.new
    render :layout => "create"
  end
  
  def view_before_save
    if not params_blank?(params)      
      @details = {:we => params[:week_ending], :title => params[:title], :status => params[:status]}   
    else
      flash[:error] = "Sorry Charlie, your report is missing something"
      redirect_to create_path
    end
  end
  
  def save_status
    if !params_blank?(params)
       status = params[:id].present? ? Status.find_by_id(params[:id]) : Status.new
      if status && status.id
       status.update_attributes(:id => status.id, :title => params[:title], :week_ending => params[:week_ending], :status => params[:status], :team_number => current_user_team_id, :last_edited_by => current_user.user_id)
      elsif status
        status.title = params[:title]
        status.week_ending  = params[:week_ending]
        status.status = params[:status]
        status.team_number = current_user.role
        status.last_edited_by = current_user.user_id
        status.save!
      end 
    else
      redirect_to home_url
      flash[:notice] = "Your changes were not saved, something went wrong!"
    end
  end
  
  def latest_updates
    str = ''
    status = Status.all
    nstatus = status.last(3).sort_by{ |update| update.updated_at}.reverse
    
    nstatus.each do |update|
    str << "<div class=\"span8\">"
    str << "<h2>\"#{h(update.title[0..30])}\"</h2>"
    str << "<p>was updated by: #{h(editor(update.last_edited_by))}</p>"  
    str << "</div>"
    end 
    
    render :text => str
      
  end
  
  def editor(num=0)
    writer = User.find_by_user_id(num)
    return writer.email
  end
  
  def statuses
    all_stats = {}
    week_ending_statuses = Status.find(:all, :select => "week_ending").map(&:week_ending).uniq!
    week_ending_statuses.each {|s| all_stats[s] = []}
    all_statuses = Status.all.sort_by {|status| status.week_ending}
    all_statuses.each do |status|
      all_stats[status.week_ending].push(status) if all_stats.has_key?(status.week_ending)
    end
    return all_stats
  end
  
  def status_for_team(all_stats, team_num)
    return [] unless all_stats.present? and team_num.present?
    return [] unless all_stats.kind_of?(Array) && team_num.kind_of?(Integer)
    statuses = all_stats.map {|s|  s if (s.team_number == team_num)}.delete_if {|x| x.nil?}
    return statuses
  end
  
  def single_status(id)
   return Status.find_by_id(id) if id
  end
  
  def view_status  
    redirect = false
    if !params_blank?(params)
      stats = params.map {|x,y| {x => y} if x.to_s.match(/status_report_+(\d*)\z/)}
      @status_reports = choose_statuses_by_id(stats.compact!)
      if @status_reports.empty?
        redirect = true
      end
    else
      redirect = true
    end
    redirect_to view_statuses_path if redirect 
  end
  
  def view_statuses
  end
  
  def awaiting_review
    @status_for_review = pending_review_statuses
    redirect_to view_statuses if @status_for_review.nil?
  end 
  
  def edit_status
    @single_s = single_status(params[:id]) if params[:id]
    if @single_s.present? && (current_user_team_id == @single_s.team_number || current_user_role == "admin")
      render :layout => "edit_status"
    else
      redirect_to view_statuses_path
      flash[:error] = "You do not have permissions to edit this team's status"
    end 
  end
  
private

  def last_edited_by_email(email_id = '')
    return email_id if email_id.to_s.empty?
    u =  User.find_by_id(email_id)
    email_id = u.email if u.respond_to?('email')
    return email_id
  end 
  
end
