class CreateCatPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_pictures do |t|
      t.string :title, presence: true, length: { in: 2..30 }
      t.text :description, presence: true, length: {maximum: 150 }
      t.decimal :price, presence: true
      t.string :image_url, presence: true
      
      t.timestamps
    end
  end
end