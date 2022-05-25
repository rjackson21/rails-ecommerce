Rails.application.routes.draw do
  get 'carts/show'
  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :users do
    resource :cart, only: [:show], on: :member
  end

  root to: 'products#index'
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
