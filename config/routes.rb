Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :foods
    resources :recipes do
      resources :shopping_list, only: [ :index ]
      resources :recipe_foods
    end
  end

  resources :public_recipes, only: [ :index ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
end
