Rails.application.routes.draw do
  get '/', to: 'welcome#index', as: "root"
  resources :attractions
  resources :users
end