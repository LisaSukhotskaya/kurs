class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :client_first_name
      t.string :client_last_name
      t.string :client_phone
      t.string :client_address
      t.timestamps
    end
  end
end
