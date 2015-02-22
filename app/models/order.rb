class Order < ActiveRecord::Base
  
  belongs_to :customer
  has_many :order_lines
  
  validates :bill_id, uniqueness: true, presence: true
  # validates :order_amount, inclusion: {in: 50..500000, message: "order must include items"}
  validates :discount, numericality: true
  
  accepts_nested_attributes_for :order_lines, reject_if: lambda {|a|a[:quantity].blank? },  allow_destroy: true
  
  # validates :order_amount
  # validates :attribute,  :acceptance => true,
  #                                 :confirmation => true,
  #                                 :exclusion => { :in => %w( mov avi ) },
  #                                 :inclusion => { :in => %w( mov avi ) },
  #                                 :format => { :with => /^[\w\d]+$/ },
  #                                 :length => { :minimum => 0, :maximum => 0, },
  #                                 :numericality => true,
  #                                 :presence => true,
  #                                 :uniqueness => true
end