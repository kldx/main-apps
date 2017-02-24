class Store::Product < ApplicationRecord
  belongs_to :productable, polymorphic: true

  validates :name, presence: {message: "can't be blank"}
end
