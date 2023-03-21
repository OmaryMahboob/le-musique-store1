class OrdersController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    @order.user = current_user
    @order.product = @product
    if @order.save
      redirect_to products_path
    else
      render "products/show", status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:payment_method, :start_date, :end_date)
  end
end
