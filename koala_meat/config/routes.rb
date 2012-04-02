KoalaMeat::Application.routes.draw do
  get "test" => "users#test", :as => "test"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "admin"   => "admin#portal", :as => "admin"
  get "forgot_password" => "users#forgot_password", :as => "forgot_password"
  post "forgot_password" => "users#forgot_password", :as => "forgot_password"
  get "catalog" => "home#catalog", :as => "catalog"
  get "contact_us" => "home#contact_us", :as => "contact_us"
  get "about_us" => "home#about_us", :as => "about_us"
  post "clean_up" => "admin#clean_up", :as => "clean_up"
  get "show_catalog_item", :to => "home#show_catalog_item", :as => "show_catalog_item"
  
  match '/welcome', :to => "home#welcome", :as => "welcome"
  match '/maint', :to => "admin#maint", :as => "maint"
  match '/mgmt', :to => "admin#mgmt", :as => "mgmt"
  match '/mgmt/edit_user', :to => "admin#edit_user", :as => "edit_user"
  match '/users/update', :to => "users#update", :as => "update"
  resources :users
  resources :sessions
  
  root :to => 'home#index'
 
end
