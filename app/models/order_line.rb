class OrderLine < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :colour
  validates :quantity, numericality: true, presence: true
  validates :colour, presence: true, uniqueness: {scope: [:order,:product]}
end
