class CartsController < ApplicationController
  def show
    cart = current_user.cart

    @products = cart.products

    @cart_products = CartProduct.where(product_id: cart.products.map(&:id))
  end
end
