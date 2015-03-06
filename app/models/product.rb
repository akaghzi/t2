class Product < ActiveRecord::Base
  has_many :order_lines
  validates :code, :specification, presence: true, uniqueness: true
  validates :price, numericality: true, inclusion: 1..10000
  before_save { |product| product.code = product.code.downcase }
  before_save { |product| product.specification = product.specification.downcase }
  
  def self.search(search)
    where("code like lower(?)", "%#{search}%")
  end
  
end