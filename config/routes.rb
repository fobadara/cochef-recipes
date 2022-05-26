Rails.application.routes.draw do
  # root :users
  devise_for :users
  resources :foods, only: %i[index show new create destroy]

  # Defines the root path route ("/")
  root "home#index"

  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: %i[new create edit update destroy]
  end
end
