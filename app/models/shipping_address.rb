class ShippingAddress < ApplicationRecord
  belongs_to :customer

  with_options presence: true do
    validates :postcode
    validates :address
    validates :name
  end

  validates :postcode, format: { with: /\A\d{7}\z/ }
  # 郵便番号はハイフンなしの7桁のみ登録可能とするバリデーション


end
