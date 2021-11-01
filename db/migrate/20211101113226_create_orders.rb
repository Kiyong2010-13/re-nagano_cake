class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false, default: ""
      t.string :postal_code, null: false, default: ""
      t.string :shipping_address, null: false, default: ""
      t.string :delivery_name, null: false, default: ""
      t.integer :shipping_fee, null: false, default: ""
      t.integer :amount_billed, null: false, default: ""
      t.integer :payment_method, null: false, default: 0
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
  end
end
