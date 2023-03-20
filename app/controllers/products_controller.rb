class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @products = Product.where(sql_query, query: "%#{params[:query]}%")
    else
      @products = Product.all
    end
    @markers = @products.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {product: product})
      }
    end
  end

  def show
    @order = Order.new

    @marker = {
      lat: @product.latitude,
      lng: @product.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { product: @product })
    }
  end

  def new
    @product = Product.new
    @product.user_id = current_user
    @product.address = current_user.address
  end

  def edit
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to products_path, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Product was successfully destroyed."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :user_id, :address, photos: [])
  end
end
