Rails.application.routes.draw do
  root to: "products#index"
  resources :products do
    # resources :reviews, only: [ :new, :create ]
  end
  # resources :reviews, only: [:edit, :destroy, :update]


  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
