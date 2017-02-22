class AddSponsoredToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :sponsored, :boolean, default: false
  end
end
