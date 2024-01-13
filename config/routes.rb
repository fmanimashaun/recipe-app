Rails.application.routes.draw do
  get 'shopping_lists/index'
  devise_for :users

  # define resources
  resources :foods
  resources :recipes, except: [:edit] do
    resources :recipe_foods, only: %i[new create edit update destroy]
  end

  # define root
  root to: 'recipes#public_index'
  get '/general_shopping_list' , to: 'shopping_lists#index'
end
