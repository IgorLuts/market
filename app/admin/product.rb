ActiveAdmin.register Product do

  permit_params :title, :description, :image, :price, category_ids: [], tag_ids: [], gallery: []

  index do
    selectable_column
    id_column
    column :title
    column :price
    column :created_at
    actions
  end
  show do
    
  end
  filter :categories
  filter :price

  form html: { multipart: true } do |f|
    f.inputs "Product Details" do
      f.input :title
      f.input :description, :as => :ckeditor
      f.input :image, :as => :file
      f.input :gallery, :as => :file,  :input_html => {:multiple => true} 
      f.input :price
      f.input :categories
      f.input :tags
    end
    f.actions
  end
end
