class Store::Merchandise::Collection < ApplicationRecord

  # given specific class_name to prevent NameError: uninitialized constant
  has_many :store_products, as: :productable, dependent: :destroy, class_name: 'Store::Product
end
