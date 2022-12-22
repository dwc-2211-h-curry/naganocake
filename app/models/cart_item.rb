class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  #税込価格と数量をかけて算出する。
  #subtotal=小計という意味。
  def subtotal
    item.add_tax_price*quantity
  end
  
end
