class AddShapeSizeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :shape_size, :float
  end
end
