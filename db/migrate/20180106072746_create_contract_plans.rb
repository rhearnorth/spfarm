class CreateContractPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :contract_plans do |t|
      t.decimal :hash_rate
      t.string :price
      t.integer :contract_long

      t.timestamps
    end
  end
end
