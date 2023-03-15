Rails.application.routes.draw do
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  devise_for :users
  resources :products do
    resources :orders, only: [:create]
  end
  resources :orders, only: %i[edit destroy update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
