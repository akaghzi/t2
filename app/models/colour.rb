class Colour < ActiveRecord::Base
  has_many :order_lines
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  
  before_save {|colour|colour.name = colour.name.downcase}
end
