class Order < ApplicationRecord
	
	belongs_to :end_user
	has_many :order_products
	accepts_nested_attributes_for :order_products, allow_destroy: true

	enum payment_method: { クレジットカード: 0, 銀行振込: 1 }

	def full_address
		self.zipcord + self.address + self.name
	end

	attr_accessor :address_option
end
