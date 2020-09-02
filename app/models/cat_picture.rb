class CatPicture < ApplicationRecord
    has_many :line_cat_pictures, dependent: :nullify
    has_one_attached :cat_image
    has_many :carts, through: :line_cat_pictures
end
