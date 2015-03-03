class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer, index: true
      t.decimal :order_amount, precision: 10, scale: 2
      t.string :bill_id
      t.decimal :discount, precision: 2, scale: 2
      t.datetime :ordered_at, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :customers
  end
end
