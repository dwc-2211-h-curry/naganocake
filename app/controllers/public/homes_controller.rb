class Public::HomesController < ApplicationController

  def top
    @items = Item.last(4)
  end

  def about
  end

end
