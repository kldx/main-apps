class Store::Merchandise::Collection < ApplicationRecord

  has_many :store_products, as: :productable, dependent: :destroy, class_name: 'Store::Product
end
