class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :shipping_postal_code, null: false
      t.string :shipping_address, null: false
      t.string :shipping_name, null: false
      t.integer :postage, null: false, default: 800
      t.integer :total, null: false
      t.integer :payment_way, null: false, default: 0
      t.integer :order_status, null: false, default: 0
      t.timestamps
    end
  end
end
