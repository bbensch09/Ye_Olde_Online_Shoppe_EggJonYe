class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :items, :users, table_name: :shopping_carts do |t|
       # t.index :item_id
       # t.index :user_id
    end
  end
end
