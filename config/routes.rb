Rails.application.routes.draw do
  root to: 'products#index'

  devise_for :users, :controllers => { :registrations => "registrations" }

  get "/cart", to: "carts#show"

  resources :products

  resources :cart_products, only: [:create]
end
