class OrdersController < ApplicationController


	def new
		@order = Order.new
	end

	def index
		@orders = Order.all
	end

	def confirm
		@order = Order.new
		@order_product = OrderProduct.new
		@cart_products = current_end_user.cart_products
		@order.payment_method = params[:order][:payment_method]
		@order.shipping = "800".to_i
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
		binding.pry
		@order = Order.new(order_params)
		@order.save
		current_end_user.cart_products.clear
		redirect_to order_thanks_path
	end


	private

	def order_params
		params.require(:order).permit(:zipcord, :address, :name, :shipping, :total_payment, :payment_method, [:product_id, :quantity]).merge(end_user_id: current_end_user.id)
	end


end
