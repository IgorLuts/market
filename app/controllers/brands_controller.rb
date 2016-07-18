class BrandsController < ApplicationController
  before_action :find_categories

  def show
    @brand = Brand.includes(:products).friendly.find(params[:id])
    if request.path != brand_path(@brand)
      redirect_to brand_path(@brand), status: :moved_permanently
    end
  end
end
