class Product < ActiveRecord::Base
  extend FriendlyId

  belongs_to :brand

  has_many :product_tags, dependent: :destroy
  has_many :tags, through: :product_tags
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories
  has_many :attachments
  accepts_nested_attributes_for :attachments, allow_destroy: true

  mount_uploader :image, ImageUploader
  mount_uploaders :gallery, GalleryUploader

  scope :all_except, ->(product) { where.not(id: product.id) }
  scope :similar, ->(product) {
    joins(:tags).where('tags.name = ?', product.tags.first.name.to_s) if product.tags.present?
  }
  validates :categories, :tags, :title, :description, :image, :price, presence: true

  friendly_id :title, use: :slugged

  paginates_per 15

  def normalize_friendly_id(text)
    text.to_slug.normalize(transliterations: :russian).to_s
  end

  def delivery_cost
    if brand.name == 'Ладас'
      '0'
    elsif brand.name == 'Babygrai' && price > 1000
      '0'
    else
      '150'
    end
  end
end
