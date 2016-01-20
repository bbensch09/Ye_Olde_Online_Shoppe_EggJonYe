class User < ActiveRecord::Base
  has_secure_password

  has_many :items, through: :shopping_cart
  has_many :user_addresses
  has_many :financial_details

  validates :username, { presence: true, uniqueness: true }
  validates :email, { presence: true, uniqueness: true }
  validates :password_digest, presence: true

end
