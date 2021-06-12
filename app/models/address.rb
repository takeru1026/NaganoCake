class Address < ApplicationRecord
    belongs_to :end_user
    validates :postcode, length: {is: 7}, numericality: {only_integer: true}
	validates :address, presence: true
	validates :addresser, presence: true
end
