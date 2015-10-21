ActiveAdmin.register Category do
  permit_params :name, :active
  sortable tree: true

  index :as => :sortable do
    label :name # item content
        actions
  end

  filter :products
  filter :created_at

  form do |f|
    f.inputs "Category Details" do
      f.input :name
      f.input :active
    end
    f.actions
  end
end
