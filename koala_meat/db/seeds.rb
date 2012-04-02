# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
#   shamalongadingdong :password_hash => "$2a$10$SmA9YfTeVJ1MSl5K0j8fYO1PPeTqZF6OLITBDHBD8uIqLPFI4iGNi", :password_salt => "$2a$10$SmA9YfTeVJ1MSl5K0j8fYO"
begin
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
rescue
end
# This begins the catalog portion

catalog_items = [
  {:item_num => "1", :name => "Peter the Koala", :price=> "$1000.00", :description => "Peter has been well-fed and is a super tasty koala!", :pic_location => "kb1.jpg"},
  {:item_num => "2", :name => "Parker the Koala", :price=> "$1000.00", :description => "Parker is a lovely Koala full of fun, and tastes great with a little bbq sauce!", :pic_location => "kb2.jpg"},
  {:item_num => "3", :name => "Stuffed Koala Bear", :price=> "$30.00", :description => "A reminder of the last time you enjoyed some Koala Meat!", :pic_location => "kb3.jpg"},
  {:item_num => "4", :name => "Koala BBQ", :price=> "$99.00", :description => "A special Koala Grill made of titanium and the tears of the forest", :pic_location => "kb4.jpg"},
  {:item_num => "5", :name => "Koala bib", :price=> "$19.99", :description => "So that your little one can enjoy fresh Koala Meat AND keep clean!", :pic_location => "kb5.jpg"},
  {:item_num => "6", :name => "Koala Plush", :price=> "$30.00", :description => "This plushy little gift keeps you warm at night and makes you salivate", :pic_location => "kb6.jpg"},
  {:item_num => "7", :name => "Lucky Koala Claws!", :price=> "$9.99 each", :description => "Known to bring good luck and fortune, purchase a REAL Koala Claw and bask in your glorious fortune", :pic_location => "kb7.jpg"},
  {:item_num => "8", :name => "Tough Guy Poster", :price=> "$9.99", :description => "Show those hippies you mean business and post this sucker on the wall!", :pic_location => "kb8.jpg"},
  {:item_num => "9", :name => "Koala Sketch Art", :price=> "$19.99", :description => "A Sketch artist caught this little appetizer in the act and now you can too", :pic_location => "kb9.jpg"}
]


catalog_items.each do |item|
  cat = Catalog.new
  cat.item_num = item[:item_num] 
  cat.name = item[:name]
  cat.price = item[:price]
  cat.description = item[:description]
  cat.pic_location = item[:pic_location]
  cat.save!
end

