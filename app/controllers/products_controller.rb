# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @product = Product.last
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @products = Product.all

    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
    @colors = Color.all
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :image, :description, :product_type, :brand)
  end
end
