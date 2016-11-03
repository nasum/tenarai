Rails.application.routes.draw do
  root :to => 'home#index'
  resource :home, only: :index
  resources :users

  namespace :admin do
    resources :home, only: :index
    resource :user_sessions, only: [ :new, :create, :destroy ]
  end
end
