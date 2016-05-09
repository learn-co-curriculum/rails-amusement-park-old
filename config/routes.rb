Rails.application.routes.draw do
  get '/', to: 'sessions#index', as: "root"
  get '/signin', to: 'sessions#new', as: "signin"
  post '/signin', to: 'sessions#create'
  resources :users
  #resources :attractions
  
end