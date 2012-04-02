class StatusController < ApplicationController
  before_filter :authenticated
  
  def latest_updates
    str = ''
    status = Status.all
    nstatus = status.sort_by{ |update| update.updated_at}[0..4].reverse
    str << "<ul class=\"status_list\">"
    nstatus.each do |update|
    str << "<li>\"#{update.title[0..30]}\" was updated by: #{editor(update.last_edited_by)}</li>"   
    end
    str << "</li>"
    render :text => str
      
  end
  
  def editor(num=0)
    writer = User.find_by_user_id(num)
    return writer.email
  end

end
