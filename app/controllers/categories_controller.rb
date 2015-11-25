class CategoriesController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def show
    @category = Category.includes(:products).friendly.find(params[:id])
  end

end
