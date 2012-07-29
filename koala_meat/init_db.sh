# Drop existing db
rvmsudo bundle exec rake db:drop

# Create a fresh db
rvmsudo bundle exec rake db:create

# Load the db schema
rvmsudo bundle exec rake db:schema:load

# Put data into the db from the db/seeds.rb file
rvmsudo bundle exec rake db:seed
