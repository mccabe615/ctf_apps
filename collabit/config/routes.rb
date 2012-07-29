Collabit::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "log_in"
  get "create_user" => "users#new", :as => "create_user"
  get "home" => "home#index", :as => "home"
  get "latest" => "status#latest_updates",:as => "latest"
  post "statuses" => "status#view_before_save", :as => "statuses"
  post "save_status" => "status#save_status", :as => "save_status"
  post "view_status" => "status#view_status", :as => "view_status"
  get "view_statuses" => "status#view_statuses", :as => "view_statuses"
  post "edit_status" => "status#edit_status", :as => "edit_status"
  post "view_before_save" => "status#view_before_save", :as => "view_before_save"
  get "create" => "status#create", :as => "create"
  get "view_profile" => "profile#view", :as => "view_profile"
  get "edit_profile" => "profile#edit", :as => "edit_profile"
  post "save_profile" => "profile#save", :as => "save_profile"
  get  "admin" => "admin#index", :as => "admin"
  get  "edit_users" => "users#edit", :as => "edit_users"
  get "modify_user" => "users#modify", :as => "modify_user"
  post "save_user" => "users#save", :as => "save_user"
  post "delete_user" => "users#delete", :as => "delete_user"
  get  "awaiting_review" => "status#awaiting_review", :as => "awaiting_review"
  
  resources :users
  resources :sessions

  root :to => 'sessions#new'
end
