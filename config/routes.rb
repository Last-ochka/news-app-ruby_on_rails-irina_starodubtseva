Rails.application.routes.draw do

  root 'tasks#index'
  resources :tasks 
  get 'users', to: 'users#index'  # get 'users/new'
  resources :users
  # get 'signup'  => 'users#new'

end
