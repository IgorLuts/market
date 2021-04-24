class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart

  def remove(object, quantity = 1)
    cart_item = item_for(object)
    return unless cart_item

    cart_item.delete
  end

  def add(object, price, quantity = 1, cumulative = true)
    cart_item = item_for(object)

    if cart_item
      cumulative = cumulative == true ? cart_item.quantity : 0
      cart_item.quantity = (cumulative + quantity)
      cart_item.save
      cart_item
    else
      shape_size = object.shape_sizes.present? ? 1.5 : nil
      shopping_cart_items.create(item: object, price: price, quantity: quantity, shape_size: shape_size)
    end
  end

  def total
    subtotal
  end

  def self.remove_old_records
    old_record = ShoppingCart.where('created_at < ?', 7.days.ago)
    delete(old_record)
  end
end
