class UserAddress < ActiveRecord::Base

  validates :user_id, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :address_type, presence: true

end
