class OrdersController < ApplicationController

	def new
		@order = Order.new
		@end_user = EndUser.find(params[:id])
	end

	def create
		@order = Order.new(order_params)
		@order.save
		redirect_to root_path
	end

	def show
	end

	private

	def order_params
		params.require(:order).permit(:end_user_id, :zipcord, :address, :name, :shipping, :total_payment, :payment_method, :status)
	end
end
