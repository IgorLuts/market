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

    shopping_cart_item.update(
      shopping_cart_item_params.merge(
        price: product_price(shopping_cart_item_params[:shape_size], shopping_cart_item)
      )
    )

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

  def product_price(shape_size, shopping_cart_item)
    is_higher_size = shopping_cart_item.item.shape_sizes.max

    shape_size == is_higher_size ? shopping_cart_item.price + Money.from_amount(1000, "USD") : shopping_cart_item.price - Money.from_amount(1000, "USD")
  end
end
