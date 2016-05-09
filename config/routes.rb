Rails.application.routes.draw do
  resources :attractions, only: [:show, :edit, :index, :update, :new, :create]

  delete '/attractions/:id', as: "delete_attraction", to: "attractions#destroy"

  resources :users

  root 'home#index'

  post '/rides/new', to: "rides#new"
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/signout', to: "sessions#destroy"

end
