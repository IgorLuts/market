class StoreController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def index
    @popular_products = Product.popular.limit(6)
    @novinki = Product.novinki.limit(6)
    @main_page = Page.find_by(slug: 'main_page_content')
  end
end
