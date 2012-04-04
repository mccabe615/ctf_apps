# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


users = [
  {:email => "ken@ci.com", :password => "ken", :user_id => 1, :roles => 0},
  {:email => "larry@ci.com", :password => "l4rry", :user_id => 2, :roles => 1},
  {:email => "moe@ci.com", :password => "m0e", :user_id => 3, :roles => 2},
  {:email => "curly@ci.com", :password => "curly", :user_id => 4, :roles => 3},
]

users.each do |u|
  user = User.new
  user.email = u[:email]
  user.password = u[:password]
  user.user_id = u[:user_id]
  user.roles = u[:roles]
  user.save!
end 

status_reports = [
  {:last_edited_by => 2, :status => "This week was a light week in Finance, had not much to say", :week_ending => "March 30", :title => "Weekly Finance Report", :team_number => 1},
  {:last_edited_by => 3, :status => "This week was a light week in HR, had not much to say", :week_ending => "March 30", :title => "Weekly HR Stuff", :team_number => 2},
  {:last_edited_by => 4, :status => "This week was a light week in Janitorial Services, had not much to say", :week_ending => "March 30", :title => "This week, in simple green", :team_number => 3},
]

status_reports.each do |stat|
  status = Status.new
  status.last_edited_by = stat[:last_edited_by]
  status.status = stat[:status]
  status.week_ending = stat[:week_ending]
  status.title = stat[:title]
  status.team_number = stat[:team_number]
  status.save!
end 