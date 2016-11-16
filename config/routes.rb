Rails.application.routes.draw do
  root to: 'home#index'
  resource :home, only: :index
  resources :dashboard, only: :index
  
  resources :users
  resource :user_sessions, only: [ :new, :create, :destroy ]
  resources :articles
end
