class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :confirm]

  # GET /orders
  # GET /orders.json
  def index
    if current_user.admin?
      @order_type = params[:order_type]
      @orders = case @order_type
      when "waiting_approval"
        Order.waiting_approval_orders
      when "confirmed"
        Order.confirmed_orders
      else
        Order.bought_orders
      end
    else
      @orders = current_user.orders
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(create_order_params)
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
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    if current_user.admin?
      if @order.approve_by(current_user)
        respond_to do |format|
          format.html { redirect_to orders_url, notice: 'Order has been approved' }
          format.json { render json: {}, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to root, notice: 'Not Authorized' }
        format.json { render json: {}, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = if current_user.admin?
        Order.find(params[:id])
      else
        current_user.orders.find_by(params[:id])
      end
      authorize @order
    end

    def update_order_params
      params.require(:order).permit(:slip_image)
    end

    def create_order_params
      params[:order] = { user_id: current_user.id }
      params[:order].merge!(contract_plan.slice(:hash_rate, :price, :contract_long))
      params.require(:order).permit(:hash_rate, :price, :user_id, :contract_long)
    end

    def contract_plan
      return unless params[:contract_plan_id]
      @contract_plan ||= ContractPlan.find(params[:contract_plan_id])
    end
end
