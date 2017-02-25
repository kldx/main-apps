class RemoveColumnFromStoreProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :store_products, :product_id
  end
end
