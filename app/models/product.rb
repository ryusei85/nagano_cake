class Product < ApplicationRecord
	attachment :image

	 has_many :cart_products
	 has_many :order_products

	 validates :name, presence: true
	 validates :price, presence: true

end
