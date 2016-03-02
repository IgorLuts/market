class Comment < ActiveRecord::Base
  belongs_to :product
  validates :user_name, :body, presence: true

  default_scope { order(:updated_at) }
end
