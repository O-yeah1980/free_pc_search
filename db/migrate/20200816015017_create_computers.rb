class CreateComputers < ActiveRecord::Migration[5.2]
  def change
    create_table :computers do |t|
      t.string :pc_number, null: false
      t.integer :post_id, null: false
      t.integer :special_function
      t.integer :use_method, null: false
      t.references :department, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
