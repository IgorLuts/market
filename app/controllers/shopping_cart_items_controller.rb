class ShoppingCartItemsController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def create
    @product = Product.find(params[:product_id])
    if params[:shopping_cart_item]
      @quantity = params[:shopping_cart_item][:quantity].to_i
      @shopping_cart.add(@product, @product.price, @quantity)
    else
      @shopping_cart.add(@product, @product.price)
    end
    redirect_to shopping_cart_path
  end

  def update
    shopping_cart_item = ShoppingCartItem.find_by(id: params[:item_id])

    new_price = shopping_cart_item_params[:shape_size] == '2.0' ? shopping_cart_item.price + Money.from_amount(1000, "USD") : shopping_cart_item.price - Money.from_amount(1000, "USD")

    shopping_cart_item.update(shopping_cart_item_params.merge(price: new_price))

    redirect_to shopping_cart_path
  end

  def destroy
    @item = Product.find(params[:product_id])
    @shopping_cart.remove(@item)
    redirect_to shopping_cart_path
  end

  def shopping_cart_item_params
    params.require(:shopping_cart_item).permit(:shape_size)
  end
end
