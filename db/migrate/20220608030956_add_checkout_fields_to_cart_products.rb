class AddCheckoutFieldsToCartProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_products, :checked_out, :boolean
    add_column :cart_products, :checkout_id, :integer
  end
end
