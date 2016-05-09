Rails.application.routes.draw do

  resources :users
  resources :attractions

  get '/', to: 'users#new'

end
