Rails.application.routes.draw do
  root :to => 'home#index'
  resource :home, only: :index
  resources :user_sessions, only: [ :create, :destroy ]
  resources :users

  namespace :admin do
    resources :home, only: :index
  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
