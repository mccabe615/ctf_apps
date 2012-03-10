#rvmsudo bundle exec script/rails s -b 0.0.0.0 -p 80
#rvmsudo bundle exec unicorn -p 80 -E production
# Development env, uncomment line below
rvmsudo bundle exec unicorn -p 80
