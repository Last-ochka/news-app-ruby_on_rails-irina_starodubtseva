Rails.application.routes.draw do
  # root 'tasks#index' # #
  resources :tasks
  resources :users
  post '/auth/login', to: 'authentication#login'
  get '/login', to: 'application#show'
end
