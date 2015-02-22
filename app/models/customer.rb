class Customer < ActiveRecord::Base
  has_many :orders
  validates :owner, :store, :city, :phone, presence: true
  before_save { |customer| customer.owner = customer.owner.downcase }
  before_save { |customer| customer.store = customer.store.downcase }
  before_save { |customer| customer.city = customer.city.downcase }
end
