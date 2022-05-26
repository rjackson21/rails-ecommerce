Rails.application.routes.draw do
  get 'cart_products/create'
  get 'carts/show'
  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :users do
    resource :cart, only: [:show], on: :member
  end

  resources :cart_products, only: [:create]

  root to: 'products#index'
  resources :products
end
