class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :find_categories, :set_cart, if: :devise_controller?
  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :category_path, :category_product_path, :category_product_url

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| 
      u.permit(:password, :password_confirmation, :current_password) 
    }
  end

  def find_categories
    @categories = Rails.cache.fetch("global/categories", expires_in: 10.minutes) do
      Category.where({:active => true}).arrange
    end
  end

  def set_cart 
    shopping_cart_id = session[:shopping_cart_id]
    @shopping_cart = session[:shopping_cart_id] ? ShoppingCart.find(shopping_cart_id) : ShoppingCart.create
    session[:shopping_cart_id] = @shopping_cart.id
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def category_path(category)
    unless category.is_root?
      category_long_path category.parent, category
    else
      category_short_path category
    end
  end

  def category_product_path(category, product)
    unless category.is_root?
      category_product_long_path category.parent, category, product
    else
      category_product_short_path category, product
    end
  end
  def category_product_url(category, product)
    unless category.is_root?
      category_product_long_url category.parent, category, product
    else
      category_product_short_url category, product
    end
  end

end
