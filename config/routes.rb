Rails.application.routes.draw do
  get 'sessions/signup'
  get 'sessions/signin'
  get 'sessions/signout'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#index'
end
