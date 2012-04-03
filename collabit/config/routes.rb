Collabit::Application.routes.draw do
  get "sessions/new"
  get "users/new"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "log_in"
  get "register" => "users#new", :as => "register"
  get "home" => "home#index", :as => "home"
  get "latest" => "status#latest_updates",:as => "latest"
  get "create" => "status#create", :as => "create"
  post "statuses" => "status#doit", :as => "statuses"
  
  resources :users
  resources :sessions

  root :to => 'sessions#new'
end
