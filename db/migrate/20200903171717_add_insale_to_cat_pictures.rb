class AddInsaleToCatPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :cat_pictures, :insale, :boolean, default: true
  end
end
