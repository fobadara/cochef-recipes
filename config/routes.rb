Rails.application.routes.draw do
  devise_for :users
  root 'public_recipes#index'

  resources :foods, only: %i[index new create destroy]
  resources :general_shopping_lists, only: %i[index]
  resources :public_recipes, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
