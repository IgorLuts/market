ActiveAdmin.register Category do
  permit_params :name, :active, :description, :meta_title, :meta_description, :meta_keywords, :slug
  sortable tree: true
  
  config.filters = false

  index :as => :sortable do
    label :name # item content
        actions
  end

  form do |f|
    f.inputs "Category Details" do
      f.input :name
      f.input :slug
      f.input :description, :as => :ckeditor
      f.input :meta_title
      f.input :meta_description
      f.input :meta_keywords
      f.input :active
    end
    f.actions
  end
end
