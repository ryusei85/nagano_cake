class CartProductsController < ApplicationController


  def index
    @cart_products = CartProduct.all
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.quantity += params[:quantity].to_i
	 @cart_product.save!
      redirect_to cart_products_path

  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity, :product_id).merge(end_user_id: current_end_user.id)
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
