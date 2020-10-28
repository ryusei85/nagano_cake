class Delivery < ApplicationRecord

	def full_delivery
		self.zipcord + self.address + self.name
	end

end
