Rails.application.routes.draw do
  devise_for :users

  # define resources
  resources :recipes
  resources :foods

  # define root
  root to: 'recipes#public_index'
end
