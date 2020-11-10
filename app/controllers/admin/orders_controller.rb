class Admin::OrdersController < ApplicationController

	layout 'admin'

	before_action :authenticate_admin!

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@order_products = @order.order_products.all

	end
end
