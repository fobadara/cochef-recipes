Rails.application.routes.draw do
  devise_for :users
  get 'foods/index'
  root 'foods#index'

  resources :foods, only: %i[index new create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
