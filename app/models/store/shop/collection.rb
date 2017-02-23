class Store::Shop::Collection < ApplicationRecord

  after_create :create_collection
  after_create :set_status

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
