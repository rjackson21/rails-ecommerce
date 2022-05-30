class FavoritesController < ApplicationController
  def create
    if current_user
      favorite = Favorite.find_by(user_id: current_user.id, product_id: params[:product_id])

      if favorite
        favorite.destroy
      else
        Favorite.create(
          user_id: current_user.id,
          product_id: params[:product_id]
        )
      end
    else
      flash[:notice] = "You need to sign in to favorite products."
    end

    redirect_back(fallback_location: root_path)
  end
end
