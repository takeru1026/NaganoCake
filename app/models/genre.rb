class Genre < ApplicationRecord
    has_many :items
    varidates :name, presence: true
end
