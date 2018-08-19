class PagesController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def show
    @page = Page.find_by!(slug: params[:id])
  end
end
