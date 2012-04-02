Collabit::Application.routes.draw do
  get "sessions/new"
  get "users/new"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "log_in"
  get "register" => "users#new", :as => "register"
  get "home" => "home#index", :as => "home"
  get "test" => "home#test", :as => "test"
  
  resources :users
  resources :sessions

  root :to => 'sessions#new'
end
