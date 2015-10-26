class Product < ActiveRecord::Base
  has_many :product_categories, :dependent => :destroy
  has_many :categories, through: :product_categories
  has_many :product_tags
  has_many :tags, through: :product_tags

  mount_uploader :image, ImageUploader
  ratyrate_rateable 'product'
end
