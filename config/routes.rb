Rails.application.routes.draw do
  # root 'tasks#index' # #
  resources :tasks
  resources :users
  post '/auth/login', to: 'authentication#login'
end
