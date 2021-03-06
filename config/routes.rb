Rails.application.routes.draw do
  namespace :admin do
    resources :articles
resources :users

    root to: "articles#index"
  end

  root to: 'home#index'
  get 'search', to: 'home#search'
  resources :member, only: [:index, :show]
  resources :dashboard, only: :index

  resources :users, except: :index
  get 'signin', to: 'signin#new'
  resource :signin, controller: :signin, only: [ :create, :destroy ]
  resources :articles do
    collection do
      post 'preview'
    end
  end
  scope path: :'@:user_name', constraints: { user_name: /.*/ } do
    resources :user_articles, path: 'articles', only: [:index, :show]
  end
end
