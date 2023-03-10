class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @products = Product.new
  end

  def edit
  end

  def create
    @products = Product.new(product_params)
  end

  if @product.save
    redirect_to @product
  else
    render :new
  end
end

def update
  if @product.update(product_params)
    redirect_to @product
  else
    render :edit
  end
end

def destroy
  @product.destroy
  redirect_to products_url, status: :see_other
end

private

def set_product
  @product = Product.find(params[:id])
end

def product_params
  params.require(:product).permit(:title, :content)
end
