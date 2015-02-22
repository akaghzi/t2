class OrderLinesController < ApplicationController
  before_action :set_order_line, only: [:show, :edit, :update, :destroy]

  # GET /order_lines
  # GET /order_lines.json
  def index
    @order_lines = OrderLine.all
  end

  # GET /order_lines/1
  # GET /order_lines/1.json
  def show
  end

  # GET /order_lines/new
  def new
    @order_line = OrderLine.new
  end

  # GET /order_lines/1/edit
  def edit
  end

  # POST /order_lines
  # POST /order_lines.json
  def create
    @order_line = OrderLine.new(order_line_params)
    @order_line.price = Product.find(@order_line.product.id).price

    respond_to do |format|
      if @order_line.save
        # Debugging code
        logger.info "+++ order_id: #{@order_line.order_id}"
        logger.info "+++ price: #{@order_line.price}"
        logger.info "+++ quantity: #{@order_line.quantity}"
        line_total = @order_line.price * @order_line.quantity
        logger.info "+++ line_total: #{line_total}"
        order = Order.find(@order_line.order_id)
        order_total = order.order_amount || 0
        logger.info "+++ order total: #{order_total}"
        order.update(order_amount: (order_total + line_total))

        format.html { redirect_to order_path(@order_line.order_id), notice: 'Order item was successfully added.' }
        format.json { render :show, status: :created, location: @order_line }
      else
        format.html { redirect_to order_path(@order_line.order_id), alert: 'Order item was not added.' }
        format.json { render json: @order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_lines/1
  # PATCH/PUT /order_lines/1.json
  def update
    respond_to do |format|
      if @order_line.update(order_line_params)
        format.html { redirect_to @order_line, notice: 'Order line was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_line }
      else
        format.html { render :edit }
        format.json { render json: @order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_lines/1
  # DELETE /order_lines/1.json
  def destroy
    order_line = @order_line
    @order_line.destroy
    logger.info "**** ITEM DESTROYED ****"
    logger.info "+++ order_id: #{order_line.order_id}"
    logger.info "+++ price: #{order_line.price}"
    logger.info "+++ quantity: #{order_line.quantity}"
    line_total = order_line.price * order_line.quantity
    logger.info "+++ line_total: #{line_total}"
    order = Order.find(order_line.order_id)
    order_total = order.order_amount
    logger.info "+++ order total: #{order_total}"
    order.update(order_amount: (order_total - line_total))
    logger.info "****"
    
    respond_to do |format|
      format.html { redirect_to order_path(order_line.order_id), notice: 'Order was successfully updated.' }
      format.json { head :no_content }
    end
  end

  #Add item to order
    def add_order_lines
      product = Product.find(param[order_line_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_line
      @order_line = OrderLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_line_params
      params.require(:order_line).permit(:order_id, :product_id, :colour_id, :quantity, :price)
    end
end
