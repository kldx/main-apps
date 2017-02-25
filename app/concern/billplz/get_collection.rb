module Billplz
  class GetCollection
    def self.retrieve(collection_id)
      HTTParty.get(Settings.billplz.collections.url+"/#{collection_id}",
      {
        :basic_auth => {
          :username => ENV['BILLPLZ_API_SECRET_KEY']
        }
      })
    end
  end
end
