class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all
  end

  def show
    @genres = Genre.all
    @items = Item.all
    @item = Item.find(params[:id])
  end
end
