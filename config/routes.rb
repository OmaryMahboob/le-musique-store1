Rails.application.routes.draw do
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  devise_for :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  resources :products do
    resources :orders, only: %i[new create show]
  end

  resources :orders, only: %i[edit destroy update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
