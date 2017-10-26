class AddImagesToClothes < ActiveRecord::Migration[5.1]
  def change
    add_column :clothes, :image_uid, :string
  end
end
