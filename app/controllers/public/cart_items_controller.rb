class Public::CartItemsController < ApplicationController
  def index
    @customer = current_customer
    @items = Item.all
    #合計金額を表示させたい、totalを0と定義しておく。
    @total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy.all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if CartItem.find_by(item_id: params[:cart_item][:item], customer_id: current_customer.id)
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item], customer_id: current_customer.id)
      @cart_item.update(amount: params[:cart_item][:quantity].to_i+@cart_item.quantity)
    else
      @cart_item.save!
    end
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
