class RemoveColumnDefaultArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :status
    add_column :articles, :status, :integer
  end
end
