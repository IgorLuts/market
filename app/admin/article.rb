ActiveAdmin.register Article do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  form html: { multipart: true } do |f|
    f.inputs "Product Details" do
      f.input :title
      f.input :description, :as => :ckeditor
      f.input :content, :as => :ckeditor
    end
    f.actions
  end

end
