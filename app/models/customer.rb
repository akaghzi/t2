class Customer < ActiveRecord::Base
  belongs_to :city
  has_many :orders
  validates :owner, :store, :phone, presence: true
  before_save { |customer| customer.owner = customer.owner.downcase }
  before_save { |customer| customer.store = customer.store.downcase }
end
