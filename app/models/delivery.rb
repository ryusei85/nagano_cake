class Delivery < ApplicationRecord

	def full_delivery
		self.zipcord + self.address + self.name
	end

	validates :zipcord, presence: true
	validates :address, presence: true
	validates :name, presence: true

end
