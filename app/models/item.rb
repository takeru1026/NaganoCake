class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  attachment :image
  validates :product, presence: true
  validates :product_explain, presence: true
  validates :price, presence: true
end
