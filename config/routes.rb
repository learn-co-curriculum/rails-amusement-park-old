Rails.application.routes.draw do
  get '/', to: 'welcome#index', as: "index"
  resources :attractions
  resources :users
end