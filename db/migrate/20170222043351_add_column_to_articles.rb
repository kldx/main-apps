class AddColumnToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :featured, :boolean, null: false, default: false
  end
end
