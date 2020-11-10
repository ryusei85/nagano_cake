class OrdersController < ApplicationController

	before_action :authenticate_end_user!

	def new
		@order = current_end_user.orders.build
	end

	def confirm
		@order = Order.new(order_params)
		@order_products = current_end_user.cart_products.all
		@order.payment_method = params[:order][:payment_method]
		@order.shipping = "800".to_i
		@order_product = CartProduct.find_by(product_id: params[:product_id])
		if params[:order][:address_option] == "0"
			@order.zipcord = current_end_user.zipcord
			@order.address = current_end_user.address
			@order.name = current_end_user.full_name
		elsif params[:order][:address_option] == "1"
			@sta = params[:order][:order_address].to_i

			@order_address = Delivery.find(@sta)
			@order.zipcord = @order_address.zipcord
			@order.address = @order_address.address
			@order.name = @order_address.name

		elsif params[:order][:address_option] == "2"
			@order.zipcord = params[:order][:zipcode]
			@order.address = params[:order][:address]
			@order.name = params[:order][:name]
		end
	end

	def create
		@order = current_end_user.orders.new(order_params)
		@order.end_user_id = current_end_user.id
		@cart_products = current_end_user.cart_products.all
			@cart_products.each do |cart_product|
				@order_product = @order.order_products.new
				@order_product.product_id = cart_product.product.id
				@order_product.quantity = cart_product.quantity
				@order_product.price = (cart_product.product.price * 1.1).ceil
			end
		@order.save
		@order_product.save
		current_end_user.cart_products.destroy_all
		redirect_to thanks_path
	end

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@sum = 0
		@order_products = @order.order_products.all
			@order_products.each do |order_product|
				@sum += order_product.price * order_product.quantity
			end

	end


	private

	def order_params
		params.require(:order).permit(:zipcord, :address, :name, :shipping, :payment_method, :total_payment, order_product_attributes: [:order_id, :product_id, :quantity, :price]).merge(end_user_id: current_end_user.id)
	end


end
