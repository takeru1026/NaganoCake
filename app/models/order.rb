class Order < ApplicationRecord
  has_many :order_details
  belongs_to :end_user
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
  enum terms_payment: {銀行振込: 0, クレジット決済: 1}
  
  validates :terms_payment, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :addresser, presence: true
end
