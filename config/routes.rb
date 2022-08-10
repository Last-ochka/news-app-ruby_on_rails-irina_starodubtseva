Rails.application.routes.draw do
  resources :tasks
  resources :users
  post '/auth/login', to: 'authentication#login'
  get '/login', to: 'application#show'
  get '/all', to: 'tasks#users_tasks'
  get '/tasks/page/:page', to: 'tasks#index'
end
