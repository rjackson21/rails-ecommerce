class CartsController < ApplicationController
  def show
    cart = current_user.cart
    @cart = current_user.cart
    @products = cart.products
    @cart_products = CartProduct.where(product_id: cart.products.map(&:id))

    @cart_subtotal = @cart_products.map { |cp| cp.quantity * cp.product.price }.sum
    @tax=@cart_subtotal*0.08
  end
end
