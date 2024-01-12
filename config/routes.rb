Rails.application.routes.draw do
  get 'foods/index'
  get 'foods/show new edit'
  devise_for :users

  # set root path for authenticated user
  authenticated :user do
    root 'recipes#index', as: :authenticated_root
    get '/index', to: redirect('/')
    get '/public_index', to: 'recipes#public_index' 
  end

  # set root path for unauthenticated user
  unauthenticated do
    root 'recipes#public_index', as: :unauthenticated_root
    get '/public_index', to: redirect('/')
  end

  resources :recipes
end
