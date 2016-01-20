class Item < ActiveRecord::Base
  has_many :users, through: :shopping_carts
  has_many :shopping_carts
  belongs_to :category

  validates :name, { presence: true, uniqueness: true }
  validates :price, { presence: true }
  validates :description, { presence: true }
  validates :category_id, { presence: true }

  def talk
    "Woof"
  end


end
