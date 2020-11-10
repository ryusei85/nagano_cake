class Admin::ProductsController < ApplicationController

  layout 'admin'

  before_action :authenticate_admin!

  def top
    @orders = Order.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product.id)
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product.id)
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  def index
    @products = Product.all
    @products = Product.page(params[:page]).per(10)
  end


  private
  def product_params
    params.require(:product).permit(:image, :name, :body, :price)
  end

end
