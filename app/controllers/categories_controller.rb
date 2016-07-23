class CategoriesController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def show
    @category = Category.includes(:products).friendly.find(params[:id])
    @products = @category.products_with_children.page(params[:page])
    if request.path != category_path(@category)
      redirect_to category_path(@category), status: :moved_permanently
    end
  end
end
