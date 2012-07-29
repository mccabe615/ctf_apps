# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


users = [
  {:email => "admin@collabit.com", :password => "test", :user_id => 1, :role => 1, :team => "Corporate"},
  {:email => "manager@collabit.com", :password => "test", :user_id => 2, :role => 2, :team => "Finance"},
  {:email => "member@collabit.com", :password => "test", :user_id => 3, :role => 3, :team => "Finance"},
]

users.each do |u|
  user = User.new
  user.email = u[:email]
  user.password = u[:password]
  user.user_id = u[:user_id]
  user.role = u[:role]
  user.team = u[:team]
  user.save!
end 

status_reports = [
  {:last_edited_by => 1, :status => "This week was a light week in Finance, had not much to say", :week_ending => "March 30", :title => "Weekly Finance Report", :team_number => 2, :reviewed => false, :submitted => true},
  {:last_edited_by => 2, :status => "This week was a light week in HR, had not much to say", :week_ending => "March 30", :title => "Weekly HR Stuff", :team_number => 3, :reviewed => false, :submitted => true},
  {:last_edited_by => 3, :status => "This week was a light week in Janitorial Services, had not much to say", :week_ending => "March 30", :title => "This week, in simple green", :team_number => 4, :reviewed => false, :submitted => true},
]

status_reports.each do |stat|
  status = Status.new
  status.last_edited_by = stat[:last_edited_by]
  status.status = stat[:status]
  status.week_ending = stat[:week_ending]
  status.title = stat[:title]
  status.team_number = stat[:team_number]
  status.reviewed = stat[:reviewed]
  status.submitted = stat[:submitted]
  status.save!
end 

roles = [
  {:name => "admin"},
  {:name => "manager"},
  {:name => "member"}
]

roles.each do |role|
  r = Roles.new
  r.name = role[:name]
  r.save!
end

teams = [
  {:name => "Corporate"},
  {:name => "Finance"},
  {:name => "HR"},
  {:name => "Legal"},
  {:name => "IT"}
]

teams.each do |team|
  t = Teams.new
  t.name = team[:name]
  t.save!
end 
