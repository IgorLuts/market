ActiveAdmin.register Comment, :as => "ProductComment" do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :user_name, :body, :approved
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  filter :product
  filter :approved

  form html: { multipart: true } do |f|
    f.inputs "Product Details" do
      f.input :user_name
      f.input :body, as: :text
      f.input :approved
      f.input :product
    end
    f.actions
  end

end
