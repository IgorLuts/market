class ShoppingCartItemsController < ApplicationController
  before_action :set_cart
  def destroy
    @item = Product.find(params[:product_id])
     @shopping_cart.remove(@item)
    redirect_to shopping_cart_path
  end
end
