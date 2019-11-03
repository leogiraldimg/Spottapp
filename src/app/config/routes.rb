Rails.application.routes.draw do

  get 'static_pages/new'
  get 'static_pages/create'

  get '/about', to:'static_pages#about' 

  resources :contact, only: [:index, :new, :create]

  root to: "welcome#index"

  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'
  get '/users', to: 'users#new'

  get 'favorite_colleges', to: 'favorite_colleges#show'
  get 'list_likes', to: 'spotteds#list_likes'
  post 'setting_manager', to: 'administrators#setting_manager'

  resources :users, only: [:new, :create, :show]
  
  resources :colleges, only: [:new, :create, :show, :index, :edit, :update] do
    resources :spotteds, only: [:new, :create, :show, :index, :destroy]
  end
  resources :spotteds, only: [:new, :create, :show, :index, :delete] do
    resources :comments
  end

  resources :colleges do
    put :favorite, on: :member
  end
  resources :spotteds, only: [:new, :create, :show, :index] do
    resources :likes
  end

end
