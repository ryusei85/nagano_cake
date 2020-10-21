class CartProductsController < ApplicationController

	layout'application'

  before_action :set_cart_product, only: [:create, :destroy]
  before_action :set_end_user

  def index
    @cart_products = CartProduct.all
  end

  def create
    @cart_product = @end_user.cart_products.build(product_id: params[:product_id]) if @cart_product.blank?
    @cart_product.quantity += params[:quantity].to_i
	 @cart_product.save
      redirect_to cart_products_path

  end

  def destroy
    @cart.destroy
    redirect_to current_cart
  end

  private
  def set_end_user
    @end_user = current_end_user
  end

  def set_cart_product
    @cart_product = current_end_user.cart_products.find_by(product_id: params[:product_id])
  end


 #  before_action :setup_cart_product!, only: [:create, :update, :destroy]

 #  def index
 #  	@cart_products = current_end_user.cart_products
 #  end

 #  def create
 #    if @cart_product.blank?
 #      @cart_product = current_end_user.cart_products.build(product_id: params[:product_id])
 #    end

 #    @cart_product.quantity += params[:quantity].to_i
 #    @cart_producr.save
 #    redirect_to cart_products_path
 #  end

 #  def update
 #  	@cart_product = CartProduct.find(params[:id])
	# @cart_product.update
	# redirect_to cart_products_paths
 #  end

 #  def destroy
 #  	@cart_product = CartProduct.find(params[:id])
 #  	@cart_product.destroy
 #  	redirect_to cart_products_path
 #  end


 #  private

 #  def setup_cart_product!
 #    @cart_product = current_end_user.cart_products.find_by(product_id: params[:product_id])
 #  end

end
