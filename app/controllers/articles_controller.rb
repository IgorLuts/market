class ArticlesController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def index
    @articles = Article.all.page params[:page]
  end

  def show
    @article = Article.find(params[:id])
  end
end
