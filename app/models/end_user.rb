class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy

  enum is_deleted: { 退会: true, 有効: false }

  def active_for_authentication?
      super && (self.is_deleted == false)
  end

  def full_name
  	self.last_name + self.first_name
  end

  def full_address
  	self.zipcord + self.address
  end
end
