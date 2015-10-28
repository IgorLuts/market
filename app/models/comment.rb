class Comment < ActiveRecord::Base
  belongs_to :product
  validates :user_name, :body, presence: true
end
