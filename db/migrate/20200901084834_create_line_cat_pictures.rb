class CreateLineCatPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :line_cat_pictures do |t|
      t.belongs_to :cart, foreign_key: true
      t.belongs_to :cat_picture, foreign_key: true

      t.timestamps
    end
  end
end
