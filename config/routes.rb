Rails.application.routes.draw do

  post '/auth/login', to: 'authentication#login'
  get '/login', to: 'application#show'
  get '/all/page/:page', to: 'tasks#all_tasks'
  get '/tasks/page/:page', to: 'tasks#index'
  get '/all/length', to: 'tasks#all_length'
  # get '/tasks/length', to: 'tasks#tasks_length'
  get '/my/page/:page', to: 'tasks#users_tasks_only'
  get '/my/length', to: 'tasks#my_length'


  resources :tasks
  resources :users

end
