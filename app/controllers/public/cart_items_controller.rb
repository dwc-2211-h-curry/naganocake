class Public::CartItemsController < ApplicationController
  before_action :login_confirm, only: [:create, :index]

  def index
    @customer = current_customer
    @items = Item.all
    @cart_items = current_customer.cart_items.all
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
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @my_cart_items = current_customer.cart_items
    if @cart_item = @my_cart_items.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)
      @cart_item.update!(quantity: params[:cart_item][:quantity].to_i+@cart_item.quantity)
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save!
    end
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
