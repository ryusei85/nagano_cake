class DeliveriesController < ApplicationController

	def index
		@delivery = Delivery.new
		@deliveries = Delivery.all
	end

	def create
		@delivery = Delivery.new(delivery_params)
		@delivery.save
		redirect_to deliveries_path(@delivery)
	end

	def edit
		@delivery = Delivery.find(params[:id])
	end

	def update
		@delivery = Delivery.find(params[:id])
		@delivery.update(delivery_params)
		redirect_to deliveries_path(@delivery)
	end

  	def destroy
	    @delivery = Delivery.find(params[:id])
	    @delivery.destroy
	    redirect_to deliveries_path
  	end


	private

	def delivery_params
		 params.require(:delivery).permit(:zipcord, :address, :name)
	end
end
