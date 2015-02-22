class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :owner
      t.string :store
      t.string :city
      t.string :phone

      t.timestamps null: false
    end
    add_index :customers, :phone, unique: true
  end
end
