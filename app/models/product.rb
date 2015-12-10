class Product < ActiveRecord::Base
  extend FriendlyId

  has_many :product_categories, :dependent => :destroy
  has_many :categories, through: :product_categories
  has_many :product_tags, dependent: :destroy
  has_many :tags, through: :product_tags
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader
  mount_uploaders :gallery, GalleryUploader
  ratyrate_rateable 'product'

  scope :all_except, ->(product) { where.not(id: product.id) }
  scope :similar, ->(product){
   joins(:tags).where('tags.name = ?', "#{product.tags.first.name}" ) if product.tags.present?
  }
  validates :categories, :tags, :title, :description, :image, :price, presence: true
  
  friendly_id :title, use: :slugged

  paginates_per 15

  def normalize_friendly_id(text)
    text.to_slug.normalize(transliterations: :russian).to_s
  end

end
