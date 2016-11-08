Rails.application.routes.draw do
  root to: 'home#index'
  resource :home, only: :index

  get "admin" => 'admin/home#index'

  namespace :admin do
    resources :users
    resource :user_sessions, only: [ :new, :create, :destroy ]
  end
end
