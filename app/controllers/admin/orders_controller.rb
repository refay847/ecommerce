class Admin::OrdersController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!
  def index
    if params[:status].present?
      @orders = Order.where(status: params[:status])
    else
      @orders = Order.all
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.includes(:product)
  end
  def update_status
    @order = Order.find(params[:id])
    @order.update(status: params[:status])

    redirect_back fallback_location: admin_orders_path, notice: "Order status updated."
  end

end