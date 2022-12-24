class Public::SearchesController < ApplicationController

  def search
    @items = Item.where(is_active: true).looks(params[:search], params[:word]).page(params[:page]).per(10) #10項目毎にページネート
    @all_items = Item.where(is_active: true).looks(params[:search], params[:word])
  end
end