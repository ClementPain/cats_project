class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :first_name, :last_name, :string
    add_column :description, :text
  end
  def down
    remove_column :first_name, :last_name, :string
    remove_column :description, :text
  end
end
