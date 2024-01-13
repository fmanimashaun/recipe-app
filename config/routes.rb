Rails.application.routes.draw do
  devise_for :users

  # define resources
  resources :recipes
  resources :foods
  get 'general_shopping_list', to: 'shopping_lists#index'

  # define root
  root to: 'recipes#public_index'
end
