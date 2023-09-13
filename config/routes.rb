Rails.application.routes.draw do
  devise_for :users
  resources :recipes

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: [:index, :new, :create, :destroy]
 
  # Defines the root path route ("/")
  # root "articles#index"
end
