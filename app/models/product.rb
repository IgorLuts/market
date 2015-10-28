class Product < ActiveRecord::Base
  has_many :product_categories, :dependent => :destroy
  has_many :categories, through: :product_categories
  has_many :product_tags
  has_many :tags, through: :product_tags
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader
  mount_uploaders :gallery, GalleryUploader
  ratyrate_rateable 'product'

  scope :all_except, ->(product) { where.not(id: product.id) }
  scope :searching, ->(keyword){ where('title LIKE ?', "%#{keyword.downcase}%") if keyword.present? }
  scope :similar, ->(product){
   joins(:tags).where('tags.name = ?', "#{product.tags.first.name}" ) if product.tags.present?
 }

end
