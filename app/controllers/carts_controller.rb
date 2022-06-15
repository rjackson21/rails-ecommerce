class CartsController < ApplicationController
  def show
    @cart = current_user.cart

    @products = CartProduct.where(product_id: @cart.products.map(&:id)).where(checked_out: false).map(&:product)
    @cart_products = CartProduct.where(product_id: @cart.products.map(&:id)).where(checked_out: false)

    @cart_subtotal = @cart_products.map { |cp| cp.quantity * cp.product.price }.sum
    @tax=@cart_subtotal*0.08
  end
end
