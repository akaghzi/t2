class AddCityToCustomer < ActiveRecord::Migration
  def change
    add_reference :customers, :city, index: true
    add_foreign_key :customers, :cities
  end
end
