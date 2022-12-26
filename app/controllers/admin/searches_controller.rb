class Admin::SearchesController < ApplicationController

  def search
    @items = Item.looks(params[:search], params[:word]).page(params[:page]).per(8) #8項目毎にページネート
    @all_items = Item.looks(params[:search], params[:word])
  end
end