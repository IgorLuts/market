class ProductsController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result.includes(:category).page(params[:page])
  end

  def show
    @product = Product.friendly.find(params[:id])
    if request.path != category_product_path(@product)
      redirect_to category_product_path(@product), status: :moved_permanently
    end

    @similar = Product.includes(:category).similar(@product).all_except(@product).limit(3)
    @comments = @product.comments.where(approved: true)
    @comments_count = @comments.count
  end
end
