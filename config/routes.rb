Rails.application.routes.draw do
  get 'welcome/index'
  root to: 'welcome#index'

  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users
  resources :posts

  get 'login' => 'user_sessions#new', as: :login
  delete 'logout' => 'user_sessions#destroy', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
