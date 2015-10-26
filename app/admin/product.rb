ActiveAdmin.register Product do

  permit_params :title, :description, :image, :price, category_ids: [], tag_ids: []

  index do
    selectable_column
    id_column
    column :title
    column :price
    column :created_at
    actions
  end

  filter :categories
  filter :price

  form do |f|
    f.inputs "Product Details" do
      f.input :title
      f.input :description, :as => :ckeditor
      f.input :image, :as => :file
      f.input :price
      f.input :categories
      f.input :tags
    end
    f.actions
  end
end
