class OrdersController < ApplicationController
  before_action :set_cart
  before_action :find_categories


  def new
    if @shopping_cart.empty?
      redirect_to root_path, notice: "Ваша корзина пустая"
      return
    end

    @order = Order.new
  end


  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@shopping_cart)
    @order.add_total_price(@shopping_cart)
    
    respond_to do |format|
      if @order.save
        @shopping_cart.clear
        format.html { redirect_to root_path, notice: 'Ваш заказ был успешно оформен.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end



  private

    def order_params
      params.require(:order).permit(:name, :adress, :email)
    end
end
