class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_order, only: %i[update_status]

  def index
    @orders = Order.order(created_at: :desc)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path, notice: 'Pedido criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update_status
    @order.update(order_params)
    @order.schedule.update(status: order_params[:status])
  end

  private

  def load_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:customer_id, :equipament_id, :period_start, :period_end, :status, :id)
  end
end
