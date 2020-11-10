class ProductsController < ApplicationController

	layout'application'

	def top
		@products = Product.all.limit(4)
	end

	def index
		@products = Product.all
		@products = Product.page(params[:page]).reverse_order
	end

	def show
		@product = Product.find(params[:id])
		@product.price = (@product.price * 1.1).ceil
		@cart_product = CartProduct.new
	end

end
