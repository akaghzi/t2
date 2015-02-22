class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order_line = OrderLine.new(order_id: params[:id])
  end

  # GET /orders/new
  def new
    @order = Order.new(customer_id: params[:customer_id], order_amount: 0)
  end

  # GET /orders/1/edit
  def edit
    @order.order_lines.build    
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  # def destroy
  #   @order.destroy
  #   respond_to do |format|
  #     format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  
  def compute
    total = 0
    @order = Order.find(params[:order_id])
    @order.order_lines.each do |order_line|
      order_line.update(price: Product.find(order_line.product_id).price)
      total = total + (order_line.quantity * order_line.price)
    end
    @order.update(order_amount: total)
    redirect_to edit_order_path(@order), notice: 'Order was successfully updated.'
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:customer_id, :bill_id, :discount, :order_amount,  
    order_lines_attributes: [:id, :order_id,  :product_id, :colour_id, :quantity, :price, :_destroy])
  end
end
