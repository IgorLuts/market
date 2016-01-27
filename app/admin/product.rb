ActiveAdmin.register Product do

  permit_params :title, :description, :image, :price, :available, :sales_info, :meta_title, :meta_description, :meta_keywords,
                :feature, :characteristics, category_ids: [], tag_ids: [], gallery: []

  index do
    selectable_column
    id_column
    column :title
    column :price
    column :feature
    column :available
    column :created_at
    actions
  end

  filter :categories
  filter :price

  form html: { multipart: true } do |f|
    f.inputs "Product Details" do
      f.input :title
      f.input :description, :as => :ckeditor
      f.input :characteristics, :as => :ckeditor
      f.input :image, :as => :file
      f.input :gallery, :as => :file,  :input_html => {:multiple => true} 
      f.input :price
      f.input :categories
      f.input :available
      f.input :sales_info
      f.input :feature, :as => :select, :collection => ["sale", "new", "gift"]
      f.input :tags
      f.input :meta_title
      f.input :meta_description
      f.input :meta_keywords
    end
    f.actions
  end

  csv do
    column('id', humanize_name: false)
    column('available', humanize_name: false)
    column('url', humanize_name: false)        { |product| category_product_url(product.categories.first, product) }
    column('price', humanize_name: false)
    column('currencyId', humanize_name: false) { "UAH" }
    column('category', humanize_name: false)   { "Гимнастические снаряды и спортивные комплексы" }
    column('picture', humanize_name: false)    { |product| "http://ladas.xyz" + product.image.url }
    column('name', humanize_name: false)        { |product| product.title }
    column('vendor', humanize_name: false)      { "Ладас" }
  end
end
