class Item < ApplicationRecord
  belongs_to :genre
  attachment :image
  has_many :cart_items
  validates :product, presence: true
  validates :product_explain, presence: true
  validates :price, presence: true
end
