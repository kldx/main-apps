class AddCollectionIdToStoreShopCollection < ActiveRecord::Migration[5.0]
  def change
    add_column :store_shop_collections, :collection_id, :string
  end
end
