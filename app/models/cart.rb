class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_cat_pictures, dependent: :destroy
  has_many :cat_pictures, through: :line_cat_pictures 
  
end
