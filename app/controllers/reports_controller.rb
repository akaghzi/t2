class ReportsController < ApplicationController

  def index
    @sumbycustomer = Order.select("customer_id, sum(order_amount) as total").group("customer_id").order("total desc")
    @sumbytime = Order.select("strftime('%Y-%m',ordered_at) as year_month, sum(order_amount) as total").group("year_month")
    @sumbycity = Order.select("name, sum(order_amount) as total").joins(customer: :city).group("name").order("total desc")
  end

  def sumbycustomer
    @sumbycustomer = Order.select("customer_id, sum(order_amount) as total").group("customer_id")
  end

  def sumbytime
    # @sumbytime = Order.select("strftime('%Y-%m',updated_at) as year_month, sum(order_amount) as total").group("year_month")
  end

  def sumbycity
    # @sumbycity = Customer.joins(:orders).select("city, sum(order_amount) as total").group("customer_id")
  end
  
end