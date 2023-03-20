class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
  end

  def dashboard
    @orders = Order.where(user: current_user)
    @instruments = Product.where(user: current_user)
  end
end
