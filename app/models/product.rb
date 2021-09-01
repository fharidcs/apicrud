class Product < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :variants, presence: true
end
