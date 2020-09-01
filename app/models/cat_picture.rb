class CatPicture < ApplicationRecord
    has_many :line_cat_pictures, dependent: :nullify
end
