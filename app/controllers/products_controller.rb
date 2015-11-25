class ProductsController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def index   
    @products = Product.includes(:categories).searching(params[:keyword])
  end


  def show
    @product = Product.includes(:categories).friendly.find(params[:id])
    @similar = Product.similar(@product).all_except(@product).limit(3)
  end


end
