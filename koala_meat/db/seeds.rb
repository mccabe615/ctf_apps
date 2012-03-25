# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
#   shamalongadingdong :password_hash => "$2a$10$SmA9YfTeVJ1MSl5K0j8fYO1PPeTqZF6OLITBDHBD8uIqLPFI4iGNi", :password_salt => "$2a$10$SmA9YfTeVJ1MSl5K0j8fYO"


sa_user = User.new
sa_user.email = "superadmin@koala_meat.com"
sa_user.admin = true
sa_user.created_at = Time.now
sa_user.updated_at = Time.now
sa_user.password = "shamalongadingdong"
sa_user.save!

normal_user = User.new
normal_user.email = "test@koala_meat.com"
normal_user.admin = false
normal_user.created_at = Time.now
normal_user.updated_at = Time.now
normal_user.password = "test"
normal_user.save!
