class Store::Product < ApplicationRecord
  enum status: [:pending, :approved, :rejected]
  extend FriendlyId

  mount_uploader :default_picture, DefaultImageUploader
  friendly_id :name, use: [:slugged, :finders, :history]

  after_initialize :set_default_status, if: :new_record?

  belongs_to :productable, polymorphic: true

  PRODUCT_AVAILABILITY = [
    "In Stock", "Out of Stock", "Discontinued", "Pre Order"
  ]

  PRODUCT_TYPES = [
    "New", "Used"
  ]

  validates :name, presence: {message: "can't be blank"}
  validates :details, presence: {message: "can't be blank"}
  validates :default_picture, presence: {message: "can't be blank"}
  validates :price, presence: {message: "can't be blank"}
  validates :availability, presence: {message: "can't be blank"}
  validates :product_type, presence: {message: "can't be blank"}

  default_scope -> { order('store_products.created_at DESC') }
  scope :been_approved, -> { where ('status = 1')}

  def set_default_status
    self.status ||= :approved
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
