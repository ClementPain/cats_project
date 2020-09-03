class CreateOrdersDetails < ActiveRecord::Migration[5.2]
  def up
    create_table :orders_details do |t|
      t.belongs_to :order, foreign_key: true
      t.belongs_to :cat_picture, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :orders_details
  end
end
