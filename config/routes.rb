Rails.application.routes.draw do
  root :to => 'home#index'
  resource :home, only: :index

  namespace :admin do
    resources :home, only: :index
    resources :users
    resource :user_sessions, only: [ :new, :create, :destroy ]
  end
end
