class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.references :colour, index: true
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2

      t.timestamps null: false
    end
    add_foreign_key :order_lines, :orders
    add_foreign_key :order_lines, :products
  end
end
