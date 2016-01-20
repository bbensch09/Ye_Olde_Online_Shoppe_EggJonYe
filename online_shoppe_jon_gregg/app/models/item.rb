class Item < ActiveRecord::Base
  has_many :users, through: :shopping_cart
  belongs_to :category
end
