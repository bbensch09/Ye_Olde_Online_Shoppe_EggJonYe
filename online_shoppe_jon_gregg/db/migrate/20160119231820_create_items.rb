class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.string :image_url
      t.text :description
      t.belongs_to :category

      t.timestamps null: false
    end
  end
end
