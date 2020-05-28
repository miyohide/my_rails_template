Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts
  resources :users

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout
end
