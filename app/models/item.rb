class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  belongs_to :genre
  has_one_attached :image

  def add_tax_price
    (price*1.1).floor
  end
end
