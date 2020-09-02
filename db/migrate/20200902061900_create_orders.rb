class CreateOrders < ActiveRecord::Migration[5.2]
  def up
    create_table :orders do |t|
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :orders
  end
end
