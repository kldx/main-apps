class ChangeColumnDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_null :articles, :status, nil
  end
end