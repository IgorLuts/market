class ProductsController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page])
  end


  def show
    @product = Product.friendly.find(params[:id])
    @similar = Product.similar(@product).all_except(@product).limit(3)
  end


end
