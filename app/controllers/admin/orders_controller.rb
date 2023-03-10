class Admin::OrdersController < ApplicationController
  before_action :admin_login_confirm

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    @order.update(order_params)
    if @order.order_status == "payment_confirm"
      @order_details.update_all(product_status: 1)
    end
    redirect_to admin_order_path(@order)
  end

  def customer
    @order = Order.find(params[:id])
    @customer = @order.customer
    @orders = @customer.orders.page(params[:page]).per(10)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
