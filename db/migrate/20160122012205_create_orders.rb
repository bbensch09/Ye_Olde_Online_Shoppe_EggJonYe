class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status, null: false
      t.integer :user_id
      t.integer :payment_info_id
      t.timestamps null: false
    end
  end
end
