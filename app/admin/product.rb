ActiveAdmin.register Product do
  permit_params :title, :description, :image, :price, :available, :sales_info, :meta_title, :meta_description, :meta_keywords,
                :feature, :slug, :characteristics, :brand_id, :old_price, :video_url, tag_ids: [], gallery: [], category_ids: []

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

  filter :title, label: 'Поиск'
  filter :price

  form html: { multipart: true } do |f|
    f.inputs 'Product Details' do
      f.input :title
      f.input :slug if f.object.persisted?
      f.input :description, as: :ckeditor
      f.input :characteristics, as: :ckeditor
      f.input :image, as: :file
      f.input :gallery, as: :file, input_html: { multiple: true }
      f.input :video_url
      f.input :old_price
      f.input :price
      f.input :categories, as: :select, collection: Category.where(active: true)
      f.input :brand
      f.input :available
      f.input :sales_info
      f.input :feature, as: :select, collection: %w(sale new gift)
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
    column('url', humanize_name: false) { |product| product_url(product) }
    column('price', humanize_name: false)
    column('currencyId', humanize_name: false) { 'UAH' }
    column('category', humanize_name: false)   { 'Гимнастические снаряды и спортивные комплексы' }
    column('picture', humanize_name: false)    { |product| 'http://stenkishvedskie.dp.ua' + product.image.url }
    column('name', humanize_name: false, &:title)
    column('vendor', humanize_name: false) { |product| product.brand.name }
    column('delivery', humanize_name: false) { 'true' }
    column('local_delivery_cost', humanize_name: false, &:delivery_cost)
    column('local_delivery_days', humanize_name: false) { '1-2' }
  end
end
