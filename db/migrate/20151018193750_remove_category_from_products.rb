class RemoveCategoryFromProducts < ActiveRecord::Migration

  def change
    remove_index :products, [:category_id]
    remove_column :products, :category_id
  end
end
