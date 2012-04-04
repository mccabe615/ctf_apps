Collabit::Application.routes.draw do
  get "sessions/new"
  get "users/new"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "log_in"
  get "register" => "users#new", :as => "register"
  get "home" => "home#index", :as => "home"
  get "latest" => "status#latest_updates",:as => "latest"
  get "create" => "status#create", :as => "create"
  post "statuses" => "status#view_before_save", :as => "statuses"
  post "save_status" => "status#save_status", :as => "save_status"
  get "view_statuses" => "status#view_statuses", :as => "view_statuses"
  post "view_status" => "status#view_status", :as => "view_status"
  
  resources :users
  resources :sessions

  root :to => 'sessions#new'
end
