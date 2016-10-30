Rails.application.routes.draw do
  root :to => 'users#index'
  resources :user_sessions, only: [ :create, :destroy ]
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
