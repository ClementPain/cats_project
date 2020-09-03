class AddAmountToOrders < ActiveRecord::Migration[5.2]
  def up
    add_column :orders, :amount, :decimal
  end

  def down
    remove_column :orders, :amount, :decimal
  end
end
