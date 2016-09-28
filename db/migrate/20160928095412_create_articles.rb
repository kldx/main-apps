class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :default_image
      t.integer :status, default: 0
      t.belongs_to :user, foreign_key: true
      t.string :slug

      t.timestamps
    end
    add_index :articles, :slug, unique: true
  end
end
