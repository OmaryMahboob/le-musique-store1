Rails.application.routes.draw do
  root to: "products#index"
  devise_for :users
  resources :products do
    # resources :reviews, only: [ :new, :create ]
  end
  # resources :reviews, only: [:edit, :destroy, :update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
