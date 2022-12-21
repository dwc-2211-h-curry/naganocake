class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.all
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.shipping_postal_code = current_customer.shipping_postal_code
      @order.shipping_address = current_customer.shipping_address
      @order.shipping_name = current_customer.last_name+first_name
    elsif params[:order][:select_address] == "1"
      @shipping_address = ShippingAddress.find(params[:order][:shipping_address])
      @order.shipping_postal_code = @shipping_address.shipping_postal_code
      @order.shipping_address = @shipping_address.shipping_address
      @order.shipping_name = @shipping_address.shipping_name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
    @cart_items = current_customer.cart_items
    @order_new = Order.new
    render :confirm
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_way, :shipping_postal_code, :shipping_address, :shipping_name, :postage, :total, :customer_id, :order_status)
  end
end
