# Development
rvmsudo bundle exec rake db:create
rvmsudo bundle exec rake db:schema:load
rvmsudo bundle exec rake db:seed

#Production

rvmsudo RAILS_ENV=production bundle exec rake db:create
rvmsudo RAILS_ENV=production bundle exec rake db:schema:load
rvmsudo RAILS_ENV=production bundle exec rake db:seed
