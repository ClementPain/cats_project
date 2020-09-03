class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :description, :text
  end
  def down
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :description, :text
  end
end
