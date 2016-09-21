Rails.application.routes.draw do
  resources :users
  root to: 'users#signin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'

end
