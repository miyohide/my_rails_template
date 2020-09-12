Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :posts
  resources :users, except: :index

  resources :user_sessions, only: :create
  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout
end
