Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :home, only: %i[index], path: ""
  resources :posts, only: %i[index show new create]
  resources :users, only: %i[index show edit update]
end
