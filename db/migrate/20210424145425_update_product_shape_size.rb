class UpdateProductShapeSize < ActiveRecord::Migration
  def change
    remove_column :products, :shape_size, :float
    add_column :products, :shape_sizes, :text, array: true, default: []
  end
end
