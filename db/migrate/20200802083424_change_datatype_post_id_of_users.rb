class ChangeDatatypePostIdOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :post_id, :string
  end
end
