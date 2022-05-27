class CartProductsController < ApplicationController
  def create
    products_in_cart = current_user.cart.products

    if products_in_cart.map(&:id).include?(params[:product_id].to_i)
      product_in_cart = products_in_cart.where(id: params[:product_id]).first

      cart_product = CartProduct.find_by(product_id: product_in_cart, cart_id: current_user.cart.id)
      cart_product.update(quantity: cart_product.quantity + 1)
      cart_product.save
    else
      CartProduct.create(
        cart_id: params[:cart_id],
        product_id: params[:product_id],
        quantity: params[:quantity]
      )
    end

    redirect_to user_cart_path(current_user)
  end
end
