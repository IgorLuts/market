class ShoppingCartsController < ApplicationController
  before_action :set_cart
  before_action :find_categories
  
  def create
    @product = Product.find(params[:product_id])
    @shopping_cart.add(@product, @product.price)
    redirect_to shopping_cart_path
  end

  def show

  end

  def destroy
    @shopping_cart.clear
    redirect_to root_path
  end

end
