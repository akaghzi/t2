class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code, limit: 20
      t.string :specification
      t.decimal :price, precision: 10, scale: 2

      t.timestamps null: false
    end
    add_index :products, :code, unique: true
  end
end
