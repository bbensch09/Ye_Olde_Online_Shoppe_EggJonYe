class CreateFinancialDetails < ActiveRecord::Migration
  def change
    create_table :financial_details do |t|
      t.belongs_to :user
      t.integer :creditcard
      t.string :expiry
      t.belongs_to :address_id

      t.timestamps null: false
    end
  end
end
