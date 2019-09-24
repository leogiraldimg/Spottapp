Rails.application.routes.draw do

  root to: "welcome#index"

  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'
  get '/users', to: 'users#new'

  get 'navegation', to: 'navegation#show'

  resources :users, only: [:new, :create, :show]
  resources :colleges, only: [:new, :create, :show] do
  resources :spotteds, only: [:new, :create, :show, :index]
  
  end
end
