class CreateStoreMerchandiseCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :store_merchandise_collections do |t|
      t.string :title
      t.string :logo
      t.string :status
      t.timestamps
    end
  end
end
