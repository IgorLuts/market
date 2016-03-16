ActiveAdmin.register CommentReply do

	belongs_to :product_comment, parent_class: Comment
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	permit_params :user_name, :body, :product_comment_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  form do |f|
    f.inputs "Reply Details" do
      f.input :user_name
      f.input :body, as: :text
    end
    f.actions
  end


end
