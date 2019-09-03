Rails.application.routes.draw do

  root to: "welcome#index"

  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'



  resources :users, only: [:new, :create, :show]
  resources :colleges, only: [:new, :create]
end
