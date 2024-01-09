Rails.application.routes.draw do
  devise_for :users

  # the root of the application
  root "recipes#public_index"

  # redirect /recipes to the root of the application
  get "/public_index", to: redirect("/")

  # resources :recipes
  resources :recipes
end
