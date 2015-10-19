class Product < ActiveRecord::Base
  has_many :product_categories, :dependent => :destroy
  has_many :categories, through: :product_categories

  mount_uploader :image, ImageUploader
  ratyrate_rateable 'product'
end
