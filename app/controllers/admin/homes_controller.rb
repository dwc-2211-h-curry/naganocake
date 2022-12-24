class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all.page(params[:page]).per(10) #10項目毎にページネート
  end
end
