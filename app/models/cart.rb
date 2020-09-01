class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_cat_pictures, dependent: :destroy
  has_many :cat_pictures, through: :line_cat_pictures 

  def add_cat_picture(cat_picture)
    item = line_cat_pictures.find_by(cat_picture: cat_picture)
  
    if item
      item.quantity += 1
    else
      item = line_cat_pictures.new(cat_picture: cat_picture)
    end
    item
  end
  end
  
