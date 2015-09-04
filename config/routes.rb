FlatironKitchen::Application.routes.draw do
  root 'ingredients#index'
  resources :ingredients
  resources :recipes
  get '/ingredients/:id/destroy', to: 'ingredients#destroy'
  get '/recipes/:id/destroy', to: 'recipes#destroy'
end
