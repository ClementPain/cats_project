class AddQuantityToLineCatPictures < ActiveRecord::Migration[5.2]
  def up
    add_column :line_cat_pictures, :quantity, :integer, default: 1
  end

  def down
    remove_column :line_cat_pictures, :quantity, :integer, default: 1
  end
end
