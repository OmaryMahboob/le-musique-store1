class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @review.user_id = current_user
    @review.product_id = rand(1..10)
  end
end
