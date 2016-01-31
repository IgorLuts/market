class Category < ActiveRecord::Base
  extend FriendlyId

  has_many :products
  
  has_ancestry :orphan_strategy => :rootify, :cache_depth => true

  friendly_id :name, use: :slugged

  def normalize_friendly_id(text)
    text.to_slug.normalize(transliterations: :russian).to_s
  end
end
