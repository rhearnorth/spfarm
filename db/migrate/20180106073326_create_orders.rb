class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.decimal :hash_rate
      t.string :price
      t.integer :user_id
      t.datetime :confirmed_at
      t.integer :confirmed_by_user_id
      t.string :slip_image

      t.timestamps
    end
  end
end
