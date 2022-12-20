class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name_kana,
    format: { with: /\A([ｧ-ﾝﾞﾟァ-ヶー－]+）?)+\z/ }
  validates :first_name_kana,
    format: { with: /\A([ｧ-ﾝﾞﾟァ-ヶー－]+）?)+\z/ }
  validates :postcode,
    numericality: {only_integer: true}, length: { is: 7 }
  validates :phone_number,
    numericality: {only_integer: true}
end
