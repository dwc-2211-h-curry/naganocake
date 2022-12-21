class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_way: {
    credit_card: 0,
    transfer: 1}
  enum order_status: {
    payment_wait: 0,
    payment_confirm: 1,
    production: 2,
    preparing_delivery: 3,
    delivered: 4
    }
end
