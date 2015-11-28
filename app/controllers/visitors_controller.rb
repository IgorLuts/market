class VisitorsController < ApplicationController

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      @visitor.subscribe
      flash[:notice] = "Подписка успешно оформлена."
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def secure_params
    params.require(:visitor).permit(:email)
  end

end