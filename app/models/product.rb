class Product < ApplicationRecord
  has_many :product_items, dependent: :destroy
end
