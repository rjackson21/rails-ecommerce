Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :cart_products, only: [:create]
  resources :favorites, only: [:create, :destroy]
  
  get "/cart", to: "carts#show"

  resources :products

  resources :cart_products, only: [:create]

  root to: 'home#home'
end
