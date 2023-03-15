class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  def index
    @reviews = Reveiw.all
  end

  def show

  end

  def new
    @review = Review.new
    @review.user_id = current_user
    @review.order_id = rand(1..10)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    @order_id = rand(1..10)
    params.require(:review).permit(:content, :rating, :user_id, :order_id)
  end

end
