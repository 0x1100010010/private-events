Rails.application.routes.draw do
  resources :events
  resources :sessions, only: [:new, :create, :destroy]
  get 'sessions/signup', to: 'users#new'
  get 'sessions/signin', to: 'sessions#new'
  get 'sessions/signout', to: 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#index'
end
