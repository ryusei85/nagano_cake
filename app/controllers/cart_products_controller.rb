class CartProductsController < ApplicationController


  before_action :authenticate_end_user!

  def index
        @cart_products = CartProduct.all
        @cart_product = CartProduct.new
        @order_product = OrderProduct.new
      if @cart_products.present?
        render 'index'
      else
        redirect_to products_path
      end
  end

  def create
    @cart_product = current_end_user.cart_products.build(cart_product_params)
    @cart_product.end_user_id = current_end_user.id
    @cart_products = current_end_user.cart_products.all
    @cart_products.each do |cart_product|
      if cart_product.product_id == @cart_product.product_id
        new_quantity = cart_product.quantity + @cart_product.quantity
        cart_product.update_attribute(:quantity, new_quantity)
        @cart_product.delete
      end
    end
    @cart_product.save


    redirect_to cart_products_path
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(cart_product_params)
    redirect_to cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  def destroy_all
    @cart_product = CartProduct.all
    @cart_product.destroy_all
    redirect_to cart_products_path
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity, :product_id).merge(end_user_id: current_end_user.id)
  end



end
