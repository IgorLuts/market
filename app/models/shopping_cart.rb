class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart

  def remove(object, quantity = 1)
    cart_item = item_for(object)
    return unless cart_item

    cart_item.delete
  end
  
  def total
    subtotal
  end
end
