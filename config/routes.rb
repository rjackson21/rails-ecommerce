Rails.application.routes.draw do
  resources :checkouts

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :cart_products, only: [:create]
  resources :favorites, only: [:create, :destroy, :index]
  
  get "/cart", to: "carts#show"

  post "/remove_from_cart", to: "cart_products#destroy"

  resources :products

  root to: 'home#home'
end
