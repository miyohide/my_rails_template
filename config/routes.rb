Rails.application.routes.draw do
  get 'welcome/index'
  root to: 'posts#index'
  resources :posts
  resources :users

  resources :user_sessions, only: :create
  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout
end
