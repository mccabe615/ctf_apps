Collabit::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "log_in"
  get "register" => "users#new", :as => "register"
  get "test" => "users#test", :as => "test"
  get "home" => "home#index", :as => "home"
  get "latest" => "status#latest_updates",:as => "latest"
  get "create" => "status#create", :as => "create"
  post "statuses" => "status#view_before_save", :as => "statuses"
  post "save_status" => "status#save_status", :as => "save_status"
  get "view_statuses" => "status#view_statuses", :as => "view_statuses"
  post "view_status" => "status#view_status", :as => "view_status"
  post "edit_status" => "status#edit_status", :as => "edit_status"
  
  #Funny stuff
  match '/asdc', :to => "users#asdc", :as => "asdc"
  match '/asdc12', :to => "users#asdc12", :as => "asdc12"
  match '/asdc12_ctf', :to => "users#asdc12_ctf", :as => "asdc12_ctf"
  match '/admin', :to => "home#admin", :as => "admin"
  match '/admin/backup', :to => "home#admin_backup", :as => "admin_backup"
  
  resources :users
  resources :sessions

  root :to => 'sessions#new'
end
