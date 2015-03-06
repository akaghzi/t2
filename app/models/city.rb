class City < ActiveRecord::Base
  has_many :customers
  before_save { |city| city.name = city.name.downcase }
  
end
