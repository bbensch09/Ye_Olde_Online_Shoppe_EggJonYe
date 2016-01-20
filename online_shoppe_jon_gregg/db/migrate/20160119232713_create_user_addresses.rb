class CreateUserAddresses < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|
      t.belongs_to :user
      t.string :name
      t.text :address
      t.text :city
      t.string :state
      t.integer :zip
      t.string :address_type

      t.timestamps null: false
    end
  end
end
