Rails.application.routes.draw do
  get 'recipe_foods/index'
  devise_for :users

  # define resources
  resources :recipes
  resources :foods

  # define root
  root to: 'recipes#public_index'
end
