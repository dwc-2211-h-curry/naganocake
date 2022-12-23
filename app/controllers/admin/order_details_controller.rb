class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:order_detail][:order_id])
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order.order_details.all
    is_update = true
    @order_detail.update(order_detail_params)
    if @order_detail.product_status == "in_production"
      @order.update(order_status: 2)
    end
    @order_details.each do |order_detail|
      if order_detail.product_status != "production_complete"
        is_update = false
      end
    end
    if is_update
      @order.update(order_status: 3)
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :product_status)
  end
end
