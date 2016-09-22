Rails.application.routes.draw do
  resources :users
  resources :sessions
  root to: 'users#signin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'users', to: 'users#create'
  get 'signup', to: 'users#new'
  get 'index', to: 'users#index'

  post 'users/signin', to: 'sessions#create'


  get 'signin', to: 'users#signin' # signs out user



end
