Rails.application.routes.draw do
  root to: 'home#index'
  resource :home, only: :index

  get "admin" => 'admin/home#index'

  resources :users
  resource :user_sessions, only: [ :new, :create, :destroy ]
  resources :articles
end
