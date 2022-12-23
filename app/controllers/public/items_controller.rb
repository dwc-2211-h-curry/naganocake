class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.where(is_active: true).page(params[:page]).per(8) #8項目毎にページネート
    @all_items = Item.all.where(is_active: true)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
