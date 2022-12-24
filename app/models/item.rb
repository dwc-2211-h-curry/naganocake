class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  belongs_to :genre
  has_one_attached :image

  def add_tax_price
    (price*1.1).floor
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @item = Item.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @item = Item.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @item = Item.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @item = Item.where("name LIKE?","%#{word}%")
    else
      @item = Item.all
    end
  end
end
