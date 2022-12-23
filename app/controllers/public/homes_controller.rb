class Public::HomesController < ApplicationController

  def top
    @items = Item.where(is_active: true).last(4)
  end

  def about
  end

end
