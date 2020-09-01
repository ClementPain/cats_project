class Cart < ApplicationRecord
  belongs_to :user
  has_many :cat_pictures
  
end
