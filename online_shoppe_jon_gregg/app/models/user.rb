class User < ActiveRecord::Base
  has_secure_password
  has_many :items, through: :shopping_cart
  has_many :user_addresses
  has_many :financial_details
end
