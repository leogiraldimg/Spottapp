Rails.application.routes.draw do
  root to: "welcome#index"

  resources :users, only: [:new, :create]
  resources :colleges, only: [:new, :create]
end
