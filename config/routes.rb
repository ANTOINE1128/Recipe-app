Rails.application.routes.draw do
  devise_for :users
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: [:index, :new, :create, :destroy]
 
  # Defines the root path route ("/")
  root "recipes#public_recipes"
  get 'general_shopping_list', to: 'home#shopping_list'
end
