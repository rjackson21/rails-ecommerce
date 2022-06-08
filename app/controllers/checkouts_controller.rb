class CheckoutsController < ApplicationController
  def index
    @checkouts = Checkout.all
  end

  def new
  end

  def create
    cart = current_user.cart
    cart_products = CartProduct.where(cart_id: cart.id).where(checked_out: false)

    checkout = Checkout.create(
      name: params[:name],
      address: params[:address]
    )

    cart_products.each do |product|
      product.checked_out = true
      product.checkout_id = checkout.id
      product.save
    end
  end
end
