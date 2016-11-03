Rails.application.routes.draw do
  root :to => 'home#index'
  resource :home, only: :index
  resources :user_sessions, only: [ :create, :destroy ]
  resources :users

  namespace :admin do
    resources :home, only: :index
    resources :user_sessions, only: [ :new, :create, :destroy ]
  end
end
