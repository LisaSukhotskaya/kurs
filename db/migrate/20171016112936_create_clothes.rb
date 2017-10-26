class CreateClothes < ActiveRecord::Migration[5.1]
  def change
    create_table :clothes do |t|
      t.string :brand
      t.string :description
      t.string :color
      t.string :size
      t.float :cost, default: 0, null: false
      t.string :print
      t.string :cloth
      t.integer :quantity, default: 0, null: false
      t.string :gender
      t.string :type
      t.string :basket_item_size
      t.integer :basket_count, default: 0, null: false
      t.boolean :basket, default: false
      t.timestamps
    end
  end
end
