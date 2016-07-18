class StoreController < ApplicationController
  before_action :set_cart

  def index
    @popular_products = Product.includes(:category).limit(6)
    @novinki = Product.includes(:category).order(:updated_at).limit(6)
  end
end
