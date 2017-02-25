class Store::Shop::Collection < ApplicationRecord

  # given specific class_name to prevent NameError: uninitialized constant
  has_many :store_products, as: :productable, dependent: :destroy, class_name: 'Store::Product'

  after_create :create_collection
  after_create :set_status

  default_scope -> { order('store_shop_collections.created_at DESC') }
  scope :is_active, -> { where ('status = active')}

  validates :title, presence: {message: "can't be blank"}, length: { in: 2..250 }

  def set_status
    self.update_attributes(:status => "active")
  end

  private

    def create_collection
      response = Billplz::PostCollection.send(self.title)
      self.update_attributes(:collection_id => response["id"])
    end

end
