class ShoppingCartsController < ApplicationController
  layout "orders"
  before_action :set_cart
  before_action :find_categories

  def show
    @shape_size_present = @shopping_cart.shopping_cart_items.any? do |shopping_cart_item|
      shopping_cart_item.item.shape_sizes.any?(&:present?)
    end
  end

  def destroy
    @shopping_cart.clear
    redirect_to root_path
  end
end
