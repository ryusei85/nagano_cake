class CartProductsController < ApplicationController


  def index
    @cart_products = CartProduct.all
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


  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity, :product_id).merge(end_user_id: current_end_user.id)
  end


end
