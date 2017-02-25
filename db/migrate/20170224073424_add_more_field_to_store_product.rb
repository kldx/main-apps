class AddMoreFieldToStoreProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :store_products, :details, :text
    add_column :store_products, :price, :decimal
    add_column :store_products, :status, :integer
    add_column :store_products, :availability, :string
    add_column :store_products, :default_picture, :string
    add_column :store_products, :quantity, :integer
    add_column :store_products, :product_type, :string # new or used item
    add_column :store_products, :product_id, :string # billplz bill_id
    add_column :store_products, :slug, :string
    add_index :store_products, :slug, unique: true
  end
end
