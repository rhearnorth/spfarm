class AddContractLongToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :contract_long, :integer
  end
end
