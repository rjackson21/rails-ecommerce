class CartProductsController < ApplicationController
  def create
    cart = current_user.cart
    products_in_cart = CartProduct.where(product_id: cart.products.map(&:id)).where(checked_out: false).map(&:product)

    if products_in_cart.map(&:id).include?(params[:product_id].to_i)
      product_in_cart = products_in_cart.where(id: params[:product_id], checked_out: false).first

      cart_product = CartProduct.where(product_id: product_in_cart)

      cart_product.update(quantity: cart_product.quantity + 1)
      cart_product.save
    else
      CartProduct.create(
        cart_id: params[:cart_id],
        product_id: params[:product_id],
        quantity: params[:quantity],
        checked_out: false
      )
    end

    redirect_to '/cart'
  end

  def destroy
    cart = current_user.cart
    
    cart_product = CartProduct.find_by(
      product_id: params[:product_id],
      cart_id: cart.id,
      checked_out: false
    )

    if cart_product
      cart_product.destroy
    end

    redirect_to '/cart'
  end
end
