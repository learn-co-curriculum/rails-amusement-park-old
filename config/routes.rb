Rails.application.routes.draw do
  root :to => 'home#index'

  get 'signin', to: "sessions#new"

  post 'signin', to: "sessions#create"

  get 'sessions/create'

  get 'sessions/destroy'

  get '/', to: "home#index"

  delete 'logout', to: "sessions#destroy"

  resources :rides

  resources :attractions

  resources :users

end
