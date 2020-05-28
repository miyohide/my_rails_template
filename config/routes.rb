Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  root to: 'posts#index'
  resources :posts
  resources :users
end
