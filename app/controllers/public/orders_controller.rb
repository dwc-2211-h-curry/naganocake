class Public::OrdersController < ApplicationController
  before_action :cart_item_nill, only: [:new, :create]

  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.all
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.shipping_postal_code = current_customer.postcode
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name+current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @shipping_address = ShippingAddress.find(params[:order][:shipping_addresses_id])
      @order.shipping_postal_code = @shipping_address.postcode
      @order.shipping_address = @shipping_address.address
      @order.shipping_name = @shipping_address.name
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
    order = Order.new(order_params)
    order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.purchase_price = cart_item.item.add_tax_price
      @order_details.product_status = 0
      @order_details.quantity = cart_item.quantity
      @order_details.save
    end
    CartItem.destroy_all
    redirect_to complete_orders_path
  end

  def index
    @orders = Order.all.page(params[:page]).per(10) #10項目毎にページネート
  end

  def show
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_way, :shipping_postal_code, :shipping_address, :shipping_name, :postage, :total, :customer_id, :order_status)
  end

  def cart_item_nill
    cart_items = current_customer.cart_items
    if cart_items.blank?
      redirect_to cart_items_path
    end
  end
end
