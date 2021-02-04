Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  scope :sessions do
    get 'signup', to: 'users#new'
    get 'signin', to: 'sessions#new'
    get 'signout', to: 'sessions#destroy'
  end

  resources :users
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'events#index'
end
