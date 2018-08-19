ActiveAdmin.register Page do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :content, :slug, :meta_title, :meta_description, :meta_keywords
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  filter :title
  filter :content

  index do
    selectable_column
    id_column
    column :title
    column("content") { |page| truncate page.content }
    column :created_at
    actions
  end

  form html: { multipart: true } do |f|
    f.inputs "Product Details" do
      f.input :title
      f.input :slug
      f.input :meta_title
      f.input :meta_description
      f.input :meta_keywords
      f.input :content, :as => :ckeditor
    end
    f.actions
  end

end
