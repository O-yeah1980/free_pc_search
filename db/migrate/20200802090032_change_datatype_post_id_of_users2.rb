class ChangeDatatypePostIdOfUsers2 < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :post_id, :integer
  end
end
