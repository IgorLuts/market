class AddShapeSizeToShoppingCartItems < ActiveRecord::Migration
  def change
    add_column :shopping_cart_items, :shape_size, :float
  end
end
