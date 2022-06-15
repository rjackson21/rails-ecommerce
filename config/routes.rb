Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :cart_products, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy, :index]
  
  get "/cart", to: "carts#show"

  resources :products


  root to: 'home#home'
end
