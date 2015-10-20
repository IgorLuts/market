class Category < ActiveRecord::Base
  has_many :product_categories, :dependent => :destroy
  has_many :products, through: :product_categories
  
  has_ancestry :orphan_strategy => :rootify, :cache_depth => true
end
