Rails.application.routes.draw do
  root to: 'home#index'
  resource :home, only: :index
  resources :member, only: :index
  resources :dashboard, only: :index

  resources :users, except: :index
  get 'signin', to: 'signin#new'
  resource :signin, controller: :signin, only: [ :create, :destroy ]
  resources :articles
  get ':user_name', to: 'user_articles#index'
end
