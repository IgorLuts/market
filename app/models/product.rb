class Product < ActiveRecord::Base
  has_many :product_categories, :dependent => :destroy
  has_many :categories, through: :product_categories
  has_many :product_tags
  has_many :tags, through: :product_tags
  has_many :comments
  
  mount_uploader :image, ImageUploader
  mount_uploaders :gallery, GalleryUploader
  ratyrate_rateable 'product'

  def self.similar(product)
    where("title LIKE ? AND id<> ?", "%#{product.title}%", "#{product.id}").limit(3)
  end
end
