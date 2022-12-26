class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|

      t.references :customer
      t.string :postcode
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
