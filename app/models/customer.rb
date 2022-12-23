class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  validates :last_name_kana,
    format: { with: /\A([ｧ-ﾝﾞﾟァ-ヶー－]+）?)+\z/ }
  validates :first_name_kana,
    format: { with: /\A([ｧ-ﾝﾞﾟァ-ヶー－]+）?)+\z/ }
  validates :postcode,
    numericality: {only_integer: true}, length: { is: 7 }
  validates :phone_number,
    numericality: {only_integer: true}

  def full_address
    '〒'+postcode+' '+address+' '+last_name+first_name
  end

end
