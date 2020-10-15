class Admin::ProductsController < ApplicationController

  layout 'admin'

  def top
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product.id)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product.id)
  end

  def index
    @products = Product.all
  end


  private
  def product_params
    params.require(:product).permit(:image, :name, :body, :price)
  end

end
