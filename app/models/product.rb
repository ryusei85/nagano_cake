class Product < ApplicationRecord
	attachment :image

	 has_many :cart_products
end
