Rails.application.routes.draw do
  get '/', to: 'sessions#index', as: "root"
  get '/signin', to: 'sessions#new', as: "signin"
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#delete', as: "logout"
  get 'attractions/:id/ride', to: 'attractions#ride', as: "ride"

  resources :users
  resources :attractions
  
end